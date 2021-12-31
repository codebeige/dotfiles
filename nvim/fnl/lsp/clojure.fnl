(module lsp.clojure
  {autoload {ts-utils nvim-treesitter.ts_utils
             util lib.util}
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

(def- normal-mappings
  {"<C-]>"      "<Cmd>lua vim.lsp.buf.definition()<CR>"
   "K"          "<Cmd>lua vim.lsp.buf.hover()<CR>"
   "]d"         "<Cmd>lua vim.diagnostic.goto_next()<CR>"
   "[d"         "<Cmd>lua vim.diagnostic.goto_prev()<CR>"
   "gq"         "<Cmd>lua require('lib.lsp')['format-move']()<CR>g@"

   "<Leader>dd" "<Cmd>lua vim.diagnostic.setloclist()<CR>"
   "<Leader>dl" "<Cmd>lua vim.diagnostic.open_float()<CR>"
   "<Leader>dh" "<Cmd>lua vim.lsp.buf.signature_help()<CR>"

   "<Leader>fr" "<Cmd>lua require('telescope.builtin').lsp_references()<CR>"
   "<Leader>fd" "<Cmd>lua require('telescope.builtin').diagnostics()<CR>"
   "<Leader>fx" "<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>"
   "<Leader>fs" "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>"
   "<Leader>fs"      "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>"

   "<Leader>#"  "<Cmd>lua vim.lsp.buf.document_highlight()<CR>"

   "<Leader>x=" "<Cmd>lua vim.lsp.buf.formatting()<CR>"
   "<Leader>xr" "<Cmd>lua vim.lsp.buf.rename()<CR>"
   "<Leader>xc" (string.format "<Cmd>%s<CR>" (fn->viml cycle-collection))})

(def- normal-mappings-remap
  {"gqq" "gqaF"})

(def- visual-mappings
  {"gq" "<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>"})

(defn on-attach [client bufnr]
  (each [from to (pairs normal-mappings)]
    (util.bmap bufnr :n from to))
  (each [from to (pairs normal-mappings-remap)]
    (util.bmap bufnr :n from to {:noremap false}))
  (each [from to (pairs visual-mappings)]
    (util.bmap bufnr :v from to))
  (print "Clojure LSP ready."))
