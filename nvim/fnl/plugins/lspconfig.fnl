(module plugins.lspconfig
  {autoload {clojure lsp.clojure
             cmp-lsp cmp_nvim_lsp
             lsp lsp.shared
             nvim aniseed.nvim
             vscode lsp.vscode}
   require-macros [lib.macros]})

(defn update-colorscheme []
  (nvim.ex.highlight! :link :LspReferenceText :Visual)
  (nvim.ex.highlight! :link :LspReferenceRead :LspReferenceText)
  (nvim.ex.highlight! :link :LspReferenceWrite :LspReferenceText))

(def- capabilities
  (cmp-lsp.default_capabilities))

(defn config []
  (augroup :config_lspconfig
    (autocmd :ColorScheme "*" update-colorscheme))
  (update-colorscheme)
  (let [opts {:capabilities capabilities
              :on_attach lsp.on-attach}]
    (clojure.setup opts)
    (vscode.setup opts)))
