(module lsp.clojure
  {autoload {util lib.util}
   require [lib.lsp]
   require-macros [lib.macros]})

(def- normal-mappings
  {"<C-]>"      "<Cmd>lua vim.lsp.buf.definition()<CR>"
   "K"          "<Cmd>lua vim.lsp.buf.hover()<CR>"
   "]d"         "<Cmd>lua vim.diagnostic.goto_next()<CR>"
   "[d"         "<Cmd>lua vim.diagnostic.goto_prev()<CR>"
   "gq"         "<Cmd>lua require('lib.lsp')['format-move']()<CR>g@"
   "<Leader>dd" "<Cmd>lua vim.diagnostic.setloclist()<CR>"
   "<Leader>dl" "<Cmd>lua vim.diagnostic.open_float()<CR>"
   "<Leader>dr" "<Cmd>lua vim.lsp.buf.rename()<CR>"
   "<Leader>ds" "<Cmd>lua vim.lsp.buf.signature_help()<CR>"
   "<Leader>df" "<Cmd>lua vim.lsp.buf.formatting()<CR>"})

(def- normal-mappings-remap
  {"gqq" "gqaF"})

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
