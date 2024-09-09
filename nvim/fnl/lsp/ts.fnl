(fn setup [opts]
  (let [{:ts_ls ts-ls} (require :lspconfig)]
    (when (= 1 (vim.fn.executable :typescript-language-server))
      (ts-ls.setup opts))))

{: setup}
