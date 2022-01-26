(module lib.lsp
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
     "[" {:name "previous"
          :d ["<Cmd>lua vim.diagnostic.goto_prev()<CR>" "Previous diagnostic"]}
     "]" {:name "next"
          :d ["<Cmd>lua vim.diagnostic.goto_next()<CR>" "Next diagnostic"]}
     :gq ["<Cmd>lua require('lib.lsp')['format-move']()<CR>g@" "Format lines motion"]
     :gq (a.merge ["<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>" "Format selection"] {:mode "v"})}
    {:buffer bufnr})

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
         :x ["<Cmd>lua vim.lsp.buf.code_action()<CR>" "Code action..."]
         :x (a.merge ["<Cmd>lua vim.lsp.buf.code_action()<CR>" "Code action..."] {:mode "v"})}}
    {:prefix "<LocalLeader>" :buffer bufnr})

  (if client.resolved_capabilities.document_highlight
    (augroup (string.format "lib_lsp_%d" bufnr)
      (nvim.ex.autocmd :CursorHold  "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorHoldI "<buffer>" "lua vim.lsp.buf.document_highlight()")
      (nvim.ex.autocmd :CursorMoved "<buffer>" "lua vim.lsp.buf.clear_references()")))

  (print (string.format "LSP ready. [%s]" (. client :name))))
