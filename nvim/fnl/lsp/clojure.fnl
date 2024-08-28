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

(fn on-attach [client buffer]
  (let [{: on-attach} (require :lsp.shared)
        which-key (require :which-key)]
    (on-attach client buffer)
    (which-key.add
      [{1 "<LocalLeader>xc" 2 #(cycle-collection) : buffer :desc "Cycle collection"}])))

(fn setup [opts]
  (let [{:clojure_lsp clojure-lsp} (require :lspconfig)]
    (if (= 1 (vim.fn.executable :clojure-lsp))
      (clojure-lsp.setup (doto opts (tset :on_attach on-attach)))
      (print "LSP: clojure-lsp not found"))))

{: list-at-cursor
 : code-action
 : cycle-collection
 : cycle-privacy
 : on-attach
 : setup}
