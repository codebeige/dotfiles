(local {: autoload} (require :nfnl.module))
(local lspconfig (autoload :lspconfig))

(fn setup [opts]
  (lspconfig.cssls.setup opts)
  (lspconfig.eslint.setup opts)
  (lspconfig.html.setup opts)
  (lspconfig.jsonls.setup opts))

{: setup}
