(module lsp.clojure
  {autoload {a aniseed.core
             lsp lib.lsp
             lspconfig lspconfig
             ts-utils nvim-treesitter.ts_utils
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(defn list-at-cursor []
  (let [n (ts-utils.get_node_at_cursor)]
    (if (= 0 (n:named_child_count)) (n:parent) n)))

(defn code-action [cmd line column]
  (vim.lsp.buf.execute_command
    {:command cmd
     :arguments [(vim.uri_from_bufnr) line column]}))

(defn cycle-collection []
  (let [n (list-at-cursor)]
    (code-action :cycle-coll (pick-values 2 (n:start)))))

(defn cycle-privacy []
  (code-action :cycle-privacy))

(defn on-attach [client bufnr]
  (which-key.register
    {:gqq (a.merge ["gqaF" "Format root form"] {:noremap false})
     "<LocalLeader>xc" (a.merge [(string.format "<Cmd>%s<CR>" (fn->viml cycle-collection)) "Cycle collection"])}
    {:buffer bufnr})
  (lsp.on-attach client bufnr))

(defn setup [opts]
  (lspconfig.clojure_lsp.setup (a.assoc opts :on_attach on-attach)))
