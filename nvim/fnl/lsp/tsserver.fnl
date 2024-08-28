(fn setup [opts]
  (let [{: tsserver} (require :lspconfig)]
    (when (= 1 (vim.fn.executable :typescript-language-server))
      (tsserver.setup opts))))

{: setup}
