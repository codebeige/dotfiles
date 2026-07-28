(local name :clojure-lsp)

(fn code-action [client cmd line column]
  (client:exec_cmd
    {:command cmd
     :arguments [(vim.uri_from_bufnr 0) line column]}))

(fn cycle-collection [client]
  (case (vim.treesitter.get_node)
    n (code-action client :cycle-coll (pick-values 2 (n:start)))))

(fn on-attach [client buffer]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "grc"
        2 (partial cycle-collection client)
       : buffer
       :desc "Cycle collection"}])))

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
   :filetypes [:clojure]
   :root_dir root-dir
   :on_attach on-attach})

{: name
 : config}
