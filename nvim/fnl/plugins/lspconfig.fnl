(local handlers
  (let [{: border} (require :config.ui)]
    {:textDocument/hover
     (vim.lsp.with vim.lsp.handlers.hover {:border border})
     :textDocument/signatureHelp
     (vim.lsp.with vim.lsp.handlers.signatureHelp {:border border})}))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :LspReferenceText {:link :Visual})
  (vim.api.nvim_set_hl 0 :LspReferenceRead {:link :LspReferenceText})
  (vim.api.nvim_set_hl 0 :LspReferenceWrite {:link :LspReferenceText}))

(fn config []
  (let [g (vim.api.nvim_create_augroup :config_lspconfig {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:callback update-colorscheme
                                               :group g
                                               :pattern "*"}))
  (update-colorscheme)

  (let [{: on-attach} (require :lsp.shared)
        clojure (require :lsp.clojure)
        fennel (require :lsp.fennel)
        go (require :lsp.go)
        ts (require :lsp.ts)
        {:default_capabilities default-capabilities} (require :cmp_nvim_lsp)
        opts {:capabilities (default-capabilities)
              : handlers
              :on_attach on-attach}]
    (fennel.setup opts)
    (go.setup opts)
    (clojure.setup opts)
    (ts.setup opts)))

{: config}
