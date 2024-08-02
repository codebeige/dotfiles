(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local lsp (autoload :lsp.shared))
(local lspconfig (autoload :lspconfig))
(local ts-utils (autoload :nvim-treesitter.ts_utils))
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

(fn on-attach [client buffer]
  (lsp.on-attach client buffer)
  (which-key.add
    [{1 "<LocalLeader>xc" 2 #(cycle-collection) : buffer :desc "Cycle collection"}]))

(fn setup [opts]
  (if (= 1 (vim.fn.executable :clojure-lsp))
    (lspconfig.clojure_lsp.setup (nfnl.assoc opts :on_attach on-attach))
    (print "LSP: clojure-lsp not found")))

{: list-at-cursor
 : code-action
 : cycle-collection
 : cycle-privacy
 : on-attach
 : setup}
