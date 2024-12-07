(fn setup [opts]
  (let [{: gopls} (require :lspconfig)]
    (gopls.setup opts)) )

{: setup}
