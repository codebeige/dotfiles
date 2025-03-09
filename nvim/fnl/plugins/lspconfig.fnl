(local {: util} (require :lspconfig))
(local {: border} (require :config.ui))
(local cmp-nvim-lsp (require :cmp_nvim_lsp))
(local lsp (require :lsp))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :LspReferenceText {:link :Visual})
  (vim.api.nvim_set_hl 0 :LspReferenceRead {:link :LspReferenceText})
  (vim.api.nvim_set_hl 0 :LspReferenceWrite {:link :LspReferenceText}))

(fn config [opts]
  (let [au-group (vim.api.nvim_create_augroup :config_lspconfig {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:callback update-colorscheme
                                               :group au-group})
    (update-colorscheme))

  (set util.default_config.capabilities
       (vim.tbl_deep_extend :force
                            util.default_config.capabilities
                            (cmp-nvim-lsp.default_capabilities)))

  (set (. vim.lsp.handlers :textDocument/hover)
       (vim.lsp.with vim.lsp.handlers.hover {:border border}))
  (set (. vim.lsp.handlers :textDocument/signatureHelp)
       (vim.lsp.with vim.lsp.handlers.signature_help {:border border}))

  (lsp.setup opts))

{: config}
