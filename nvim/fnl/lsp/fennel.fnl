(local {:fennel_ls fennel-ls} (require :lspconfig))
(local shared (require :lsp.shared))

(fn setup [_]
  (case (vim.fn.executable :fennel-ls)
    1 (fennel-ls.setup {:on_attach shared.on-attach})))

{: setup}
