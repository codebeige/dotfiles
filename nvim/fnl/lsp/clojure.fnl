(module lsp.clojure
  {autoload {lsp lib.lsp
             ts-utils nvim-treesitter.ts_utils
             util lib.util}})

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
  (util.bmap! bufnr :n "gqq" "gqaF" {:noremap false})
  (util.bmap! bufnr :n "<Leader>lxc" (string.format "<Cmd>%s<CR>" (fn->viml cycle-collection)))
  (lsp.on-attach client bufnr))
