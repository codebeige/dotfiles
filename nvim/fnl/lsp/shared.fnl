(module lsp.shared
  {autoload {a aniseed.core
             nvim aniseed.nvim
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(defn- format-range []
  (with-restore-view
    (vim.lsp.buf.range_formatting
      {}
      (nvim.buf_get_mark 0 "[")
      (nvim.buf_get_mark 0 "]"))))

(defn format-move []
  (set-operatorfunc format-range))

(defn on-attach [client bufnr]
  (which-key.register
    {"<C-]>" ["<Cmd>lua vim.lsp.buf.definition()<CR>" "Jump to definition"]
     :K ["<Cmd>lua vim.lsp.buf.hover()<CR>" "Show documentation"]
     "[" {:d ["<Cmd>lua vim.diagnostic.goto_prev()<CR>" "Previous diagnostic"]}
     "]" {:d ["<Cmd>lua vim.diagnostic.goto_next()<CR>" "Next diagnostic"]}
     :gq ["<Cmd>lua require('lib.lsp')['format-move']()<CR>g@" "Format lines motion"]}
    {:buffer bufnr})

  (which-key.register
    {:gq ["<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>" "Format selection"]}
    {:buffer bufnr :mode "v"})

  (which-key.register
    {:b {:name "buffer"
         := ["<Cmd>lua vim.lsp.buf.formatting()<CR>" "Format buffer"]
         :d ["<Cmd>lua vim.diagnostic.setloclist()<CR>" "List diagnostics"]}
     :f {:name "find"
         :d ["<Cmd>lua require('telescope.builtin').diagnostics()<CR>" "Diagnostics"]
         :r ["<Cmd>lua require('telescope.builtin').lsp_references()<CR>" "References"]
         :s ["<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>" "Document symbols"]
         :S ["<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>" "Workspace symbols"]}
     :v {:name "view"
         :d ["<Cmd>lua vim.diagnostic.open_float()<CR>" "View diagnostics"]
         :h ["<Cmd>lua vim.lsp.buf.signature_help()<CR>" "Signature help"]}
     :x {:name "transform"
         :r ["<Cmd>lua vim.lsp.buf.rename()<CR>" "Rename symbol..."]
         :x ["<Cmd>lua vim.lsp.buf.code_action()<CR>" "Code action..."]}}
    {:prefix "<LocalLeader>" :buffer bufnr})

  (which-key.register
    {:x {:name "transform"
         :x ["<Cmd>lua vim.lsp.buf.code_action()<CR>" "Code action..."]}}
    {:prefix "<LocalLeader>" :buffer bufnr :mode "v"})

  (if client.server_capabilities.documentHighlightProvider
    (augroup (string.format "lib_lsp_%d" bufnr)
      (nvim.ex.autocmd :CursorHold  "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorHoldI "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorMoved "<buffer>" "lua vim.lsp.buf.clear_references()")))

  (print (string.format "LSP ready. [%s]" (. client :name))))
