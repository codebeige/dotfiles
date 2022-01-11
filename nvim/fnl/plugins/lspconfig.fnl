(module plugins.lspconfig
  {autoload {clojure lsp.clojure
             cmp-lsp cmp_nvim_lsp
             lsp lspconfig
             nvim aniseed.nvim}
   require-macros [lib.macros]})

(defn update-colorscheme []
  (nvim.ex.highlight :link :LspReferenceText :Visual)
  (nvim.ex.highlight :link :LspReferenceRead :LspReferenceText)
  (nvim.ex.highlight :link :LspReferenceWrite :LspReferenceText))

(def- capabilities
  (cmp-lsp.update_capabilities
    (vim.lsp.protocol.make_client_capabilities)))

(defn config []
  (augroup :config_lspconfig
    (autocmd :ColorScheme "*" update-colorscheme))
  (clojure.setup {:capabilities capabilities}))
