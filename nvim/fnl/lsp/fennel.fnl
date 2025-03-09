(local {:fennel_ls fennel-ls} (require :lspconfig))

(fn setup [_]
  (case (vim.fn.executable :fennel-ls)
    1 (fennel-ls.setup {})))

{: setup}
