(local {: autoload} (require :nfnl.module))
(local {: tsserver} (autoload :lspconfig))

(fn setup [_]
  (when (= 1 (vim.fn.executable :typescript-language-server))
    (tsserver.setup {})))

{: setup}
