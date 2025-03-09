(local {:ts_ls ts-ls} (require :lspconfig))

(fn setup [_]
  (case (vim.fn.executable :typescript-language-server)
    1 (ts-ls.setup {})))

{: setup}
