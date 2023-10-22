(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))
(local telescope (autoload :telescope.builtin))

(fn format-range []
  (let [view (vim.fn.winsaveview)]
    (pcall #(vim.lsp.buf.range_formatting
              {}
              (vim.api.nvim_buf_get_mark 0 "[")
              (vim.api.nvim_buf_get_mark 0 "]")))
    (vim.fn.restview view)))

(fn format-move []
  (set vim.g.__operatorfunc (fn []
                              (pcall format-range)
                              (set vim.g.__operatorfunc nil)))
  (set vim.o.operatorfunc :v:lua.__operatorfunc))

(fn on-attach [client bufnr]
  (which-key.register
    {"<C-]>" [#(vim.lsp.buf.definition) "Jump to definition"]
     :K [#(vim.lsp.buf.hover) "Show documentation"]
     "[" {:d [#(vim.diagnostic.goto_prev) "Previous diagnostic"]}
     "]" {:d [#(vim.diagnostic.goto_next) "Next diagnostic"]}}
    {:buffer bufnr})

  (which-key.register
    {:q {:name "format"
         :q ["<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>" "Format selection"]}}
    {:buffer bufnr :mode "v" :prefix "<LocalLeader>"})

  (which-key.register
    {:b {:name "buffer"
         := ["<Cmd>lua vim.lsp.buf.format{async=true}<CR>" "Format buffer"]
         :d [#(vim.diagnostic.setloclist) "List diagnostics"]}
     :f {:name "find"
         :d [#(telescope.diagnostics) "Diagnostics"]
         :r [#(telescope.lsp_references) "References"]
         :s [#(telescope.lsp_document_symbols) "Document symbols"]
         :S [#(telescope.lsp_workspace_symbols) "Workspace symbols"]}
     :v {:name "view"
         :d [#(vim.diagnostic.open_float) "View diagnostics"]
         :h [#(vim.lsp.buf.signature_help) "Signature help"]}
     :q {:name "format"
         :q ["<Cmd>lua require('lsp.shared')['format-move']()<CR>g@" "Format lines motion"]}
     :x {:name "transform"
         :r [#(vim.lsp.buf.rename) "Rename symbol..."]
         :x [#(vim.lsp.buf.code_action) "Code action..."]}}
    {:prefix "<LocalLeader>" :buffer bufnr})

  (which-key.register
    {:x {:name "transform"
         :x [#(vim.lsp.buf.code_action) "Code action..."]}}
    {:prefix "<LocalLeader>" :buffer bufnr :mode "v"})

  (if client.server_capabilities.documentHighlightProvider
    (let [g (vim.api.nvim_create_augroup (string.format "lib_lsp_%d" bufnr))]
      (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                   {:buffer true
                                    :callback #(vim.lsp.buf.document_highlight)
                                    :group g})
      (vim.api.nvim_create_autocmd :CursorMoved
                                   {:buffer true
                                    :callback #(vim.lsp.buf.clear_references)
                                    :group g})))

  (let [g (vim.api.nvim_create_augroup :lsp-on-attach {:clear true})]
    (vim.api.nvim_create_autocmd :BufWritePre {:buffer 0
                                               :callback #(vim.lsp.buf.format {:async false})
                                               :group g}))

  (print (string.format "LSP ready. [%s]" (. client :name))))

{: format-move
 : on-attach}
