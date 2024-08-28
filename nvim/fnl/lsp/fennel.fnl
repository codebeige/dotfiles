(fn setup [opts]
  (let [{: fennel_ls} (require :lspconfig)]
    (if (= 1 (vim.fn.executable :fennel-ls))
      (fennel_ls.setup opts)
      (print "LSP: fennel-ls not found"))))

{: setup}
