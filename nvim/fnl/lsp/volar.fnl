(local {: volar} (require :lspconfig))

(fn setup [_]
  (case (vim.fn.executable :vue-language-server)
    1 (volar.setup {})))

{: setup}
