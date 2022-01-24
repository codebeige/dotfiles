(module lib.lsp
  {autoload {nvim aniseed.nvim
             util lib.util}
   require-macros [lib.macros]})

(defn- format-range []
  (with-restore-view
    (vim.lsp.buf.range_formatting
      {}
      (nvim.buf_get_mark 0 "[")
      (nvim.buf_get_mark 0 "]"))))

(defn format-move []
  (set-operatorfunc format-range))

(def keymap-n
  {"<C-]>"           "<Cmd>lua vim.lsp.buf.definition()<CR>"
   "<LocalLeader>lh" "<Cmd>lua vim.lsp.buf.signature_help()<CR>"
   "K"               "<Cmd>lua vim.lsp.buf.hover()<CR>"

   "<LocalLeader>ll" "<Cmd>lua vim.diagnostic.setloclist()<CR>"
   "<LocalLeader>lo" "<Cmd>lua vim.diagnostic.open_float()<CR>"
   "[d"              "<Cmd>lua vim.diagnostic.goto_prev()<CR>"
   "]d"              "<Cmd>lua vim.diagnostic.goto_next()<CR>"

   "<LocalLeader>l=" "<Cmd>lua vim.lsp.buf.formatting()<CR>"
   "<LocalLeader>lr" "<Cmd>lua vim.lsp.buf.rename()<CR>"
   "<LocalLeader>lx" "<Cmd>lua vim.lsp.buf.code_action()<CR>"
   "gq"              "<Cmd>lua require('lib.lsp')['format-move']()<CR>g@"

   "<LocalLeader>l*" "<Cmd>lua require('telescope.builtin').lsp_references()<CR>"
   "<LocalLeader>ld" "<Cmd>lua require('telescope.builtin').diagnostics()<CR>"
   "<LocalLeader>ls" "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>"
   "<LocalLeader>lw" "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>"})

(def keymap-v
  {"gq"              "<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>"
   "<LocalLeader>lx" "<Cmd>lua vim.lsp.buf.range_code_action()<CR><Esc>"})

(defn on-attach [client bufnr]
  (each [lhs rhs (pairs keymap-n)] (util.bmap! bufnr :n lhs rhs))
  (each [lhs rhs (pairs keymap-v)] (util.bmap! bufnr :v lhs rhs))
  (if client.resolved_capabilities.document_highlight
    (augroup (string.format "lib_lsp_%d" bufnr)
      (nvim.ex.autocmd :CursorHold  "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorHoldI "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorMoved "<buffer>" "lua vim.lsp.buf.clear_references()")))
  (print (string.format "LSP ready. [%s]" (. client :name))))
