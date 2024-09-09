(fn setup [opts]
  (let [{:fennel_ls fennel-ls} (require :lspconfig)]
    (if (= 1 (vim.fn.executable :fennel-ls))
      (fennel-ls.setup opts)
      (print "LSP: fennel-ls not found"))))

{: setup}
