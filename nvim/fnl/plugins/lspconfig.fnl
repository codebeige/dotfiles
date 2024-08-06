(local {: autoload} (require :nfnl.module))
(local clojure (autoload :lsp.clojure))
(local cmp-lsp (autoload :cmp_nvim_lsp))
(local fennel (autoload :lsp.fennel))
(local tsserver (autoload :lsp.tsserver))
(local {: on-attach} (autoload :lsp.shared))
(local ui (autoload :config.ui))

(local capabilities
  (cmp-lsp.default_capabilities))

(local handlers
  {:textDocument/hover
   (vim.lsp.with vim.lsp.handlers.hover {:border ui.border})
   :textDocument/signatureHelp
   (vim.lsp.with vim.lsp.handlers.signatureHelp {:border ui.border})})

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
  (let [opts {: capabilities
              : handlers
              :on_attach on-attach}]
    (fennel.setup opts)
    (clojure.setup opts)
    (tsserver.setup opts)))

{1 :neovim/nvim-lspconfig
 : config
 :dependencies [:hrsh7th/cmp-nvim-lsp]}
