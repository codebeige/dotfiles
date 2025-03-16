(local {: gopls} (require :lspconfig))
(local shared (require :lsp.shared))

(fn setup [_]
  (case (vim.fn.executable :gopls)
    1 (gopls.setup {:on_attach shared.on-attach})))

{: setup}
