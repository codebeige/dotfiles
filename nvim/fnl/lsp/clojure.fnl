(module lsp.clojure
  {autoload {lsp lib.lsp
             util lib.util}
   require-macros [lib.macros]})

(defn cycle-collection []
  (vim.lsp.buf.execute_command
    {:command "cycle-coll"
     :arguments (lsp.cmd-args)}))

(def- normal-mappings
  {"<C-]>"      "<Cmd>lua vim.lsp.buf.definition()<CR>"
   "K"          "<Cmd>lua vim.lsp.buf.hover()<CR>"
   "]d"         "<Cmd>lua vim.diagnostic.goto_next()<CR>"
   "[d"         "<Cmd>lua vim.diagnostic.goto_prev()<CR>"
   "gq"         "<Cmd>lua require('lib.lsp')['format-move']()<CR>g@"
   "<Leader>gq" "<Cmd>lua vim.lsp.buf.formatting()<CR>"
   "<Leader>dd" "<Cmd>lua vim.diagnostic.setloclist()<CR>"
   "<Leader>dl" "<Cmd>lua vim.diagnostic.open_float()<CR>"
   "<Leader>dr" "<Cmd>lua vim.lsp.buf.rename()<CR>"
   "<Leader>ds" "<Cmd>lua vim.lsp.buf.signature_help()<CR>"
   "<Leader>dx" "<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>"
   "<Leader>df" "<Cmd>lua require('telescope.builtin').lsp_references()<CR>"
   "<Leader>dq" "<Cmd>lua require('telescope.builtin').diagnostics()<CR>"})

(def- normal-mappings-remap
  {"gqq" "gqaF"
   "<Leader>dc" (string.format "<Cmd>%s<CR>" (fn->viml cycle-collection))})

(def- visual-mappings
  {"<Leader>df" "<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>"})

(defn on-attach [client bufnr]
  (each [from to (pairs normal-mappings)]
    (util.bmap bufnr :n from to))
  (each [from to (pairs normal-mappings-remap)]
    (util.bmap bufnr :n from to {:noremap false}))
  (each [from to (pairs visual-mappings)]
    (util.bmap bufnr :v from to))
  (print "Clojure LSP ready."))
