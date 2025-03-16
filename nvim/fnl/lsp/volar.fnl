(local {: volar} (require :lspconfig))
(local shared (require :lsp.shared))

(fn setup [_]
  (case (vim.fn.executable :vue-language-server)
    1 (volar.setup {:on_attach shared.on-attach})))

{: setup}
