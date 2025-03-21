(local {: capabilities} (require :lsp.shared))

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

(fn root-dir [file]
  (if (vim.startswith file "zipfile://")
    (let [clients (vim.lsp.get_clients {:name :clojure-lsp})]
      (. clients (length clients) :root_dir))
    (vim.fs.root file ["deps.edn"
                       "shadow-cljs.edn"
                       "project.clj"
                       "build.boot"
                       "bb.edn"
                       ".git"])))

(fn on-ft [{: file}]
  (vim.lsp.start {:name :clojure-lsp
                  :cmd ["clojure-lsp"]
                  :on_attach on-attach
                  :root_dir (root-dir file)
                  : capabilities}))

(fn setup []
  (case (vim.fn.executable :clojure-lsp)
    1 (let [group (vim.api.nvim_create_augroup :lsp.clojure {:clear true})]
        (vim.api.nvim_create_autocmd :FileType
                                     {:pattern [:clojure :edn]
                                      :callback (fn [e] (on-ft e) nil)
                                      : group}))))

{: setup}
