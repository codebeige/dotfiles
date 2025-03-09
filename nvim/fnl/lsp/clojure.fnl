(local {:clojure_lsp clojure-lsp} (require :lspconfig))

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
      [{1 "<LocalLeader>xc" 2 #(cycle-collection) : buffer :desc "Cycle collection"}
       {1 "<LocalLeader>x-" 2 #(cycle-privacy) : buffer :desc "Cycle privacy"}])))

(fn setup [_]
  (case (vim.fn.executable :clojure-lsp)
    1 (clojure-lsp.setup {:on_attach on-attach})))

{: setup}
