(local {: gopls} (require :lspconfig))

(fn setup [_]
  (case (vim.fn.executable :gopls)
    1 (gopls.setup {})))

{: setup}
