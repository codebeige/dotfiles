(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local lsp (autoload :lsp.shared))
(local lspconfig (autoload :lspconfig))
(local ts-utils (autoload :nvim-treesitter.ts_utils))
(local util (autoload :lib.util))
(local which-key (autoload :which-key))

(fn list-at-cursor []
  (let [n (ts-utils.get_node_at_cursor)]
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

(fn on-attach [client bufnr]
  (which-key.register
    {:xc [cycle-collection "Cycle collection"]}
    {:buffer bufnr
     :prefix "<LocalLeader>"})
  (lsp.on-attach client bufnr))

(fn setup [opts]
  (lspconfig.clojure_lsp.setup (nfnl.assoc opts :on_attach on-attach)))

{: list-at-cursor
 : code-action
 : cycle-collection
 : cycle-privacy
 : on-attach
 : setup}
