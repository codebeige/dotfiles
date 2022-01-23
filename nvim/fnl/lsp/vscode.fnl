(module lsp.vscode
  {autoload {lspconfig lspconfig}})

(defn setup [opts]
  (lspconfig.cssls.setup opts)
  (lspconfig.eslint.setup opts)
  (lspconfig.html.setup opts)
  (lspconfig.jsonls.setup opts))
