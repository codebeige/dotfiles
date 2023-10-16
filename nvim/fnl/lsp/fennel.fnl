(module lsp.fennel
  {autoload {lspconfig lspconfig}})

(defn setup [opts]
  (lspconfig.fennel_ls.setup opts))
