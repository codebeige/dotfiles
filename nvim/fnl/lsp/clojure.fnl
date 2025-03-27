(local name :clojure-lsp)

(fn list-at-cursor []
  (let [ts-utils (require :nvim-treesitter.ts_utils)
        n (ts-utils.get_node_at_cursor)]
    (if (= 0 (n:named_child_count)) (n:parent) n)))

(fn code-action [cmd line column]
  (vim.lsp.buf.execute_command
    {:command cmd
     :arguments [(vim.uri_from_bufnr 0) line column]}))

(fn cycle-collection []
  (case (list-at-cursor)
    n (code-action :cycle-coll (pick-values 2 (n:start)))))

(fn cycle-privacy []
  (code-action :cycle-privacy))

(fn on-attach [_ buffer]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "grc" 2 #(cycle-collection) : buffer :desc "Cycle collection"}
       {1 "gr-" 2 #(cycle-privacy) : buffer :desc "Cycle privacy"}])))

(local root-markers
  ["deps.edn" "shadow-cljs.edn" "project.clj" "build.boot" "bb.edn" ".git"])

(fn root-dir* [file]
  (if (vim.startswith file "zipfile://")
    (let [clients (vim.lsp.get_clients {: name})]
      (. clients (length clients) :root_dir))
    (vim.fs.root file root-markers)))

(fn root-dir [buffer f]
  (-> buffer vim.api.nvim_buf_get_name root-dir* f))

(local config
  {:cmd ["clojure-lsp"]
   :filetypes [:clojure :edn]
   :root_dir root-dir
   :on_attach on-attach})

{: name
 : config}
