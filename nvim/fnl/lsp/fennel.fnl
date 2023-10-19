(local {: autoload} (require :nfnl.module))
(local {: fennel_ls} (autoload :lspconfig))

(fn setup [opts]
  (if (= 1 (vim.fn.executable :fennel-ls))
    (fennel_ls.setup opts)
    (print "LSP: fennel-ls not found")))

{: setup}
