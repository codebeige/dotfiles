(local {: autoload} (require :nfnl.module))
(local clojure (autoload :lsp.clojure))
(local cmp-lsp (autoload :cmp_nvim_lsp))
(local fennel (autoload :lsp.fennel))
(local vscode (autoload :lsp.vscode))
(local {: on-attach} (autoload :lsp.shared))

(local capabilities
  (cmp-lsp.default_capabilities))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :LspReferenceText {:link :Visual})
  (vim.api.nvim_set_hl 0 :LspReferenceRead {:link :LspReferenceText})
  (vim.api.nvim_set_hl 0 :LspReferenceWrite {:link :LspReferenceText}))

(fn config []
  (let [g (vim.api.nvim_create_augroup :config_lspconfig {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:callback update-colorscheme
                                               :group g
                                               :pattern "*"}))
  (update-colorscheme)
  (let [opts {: capabilities :on_attach on-attach}]
    (fennel.setup opts)
    (clojure.setup opts)
    ; (vscode.setup opts)
    ))

{1 :neovim/nvim-lspconfig
 : config
 :dependencies [:hrsh7th/cmp-nvim-lsp]}
