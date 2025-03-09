(local {: on-attach} (require :lsp.shared))
(local clojure (require :lsp.clojure))
(local fennel (require :lsp.fennel))
(local go (require :lsp.go))
(local ts (require :lsp.ts))

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
  (let [{:default_capabilities default-capabilities} (require :cmp_nvim_lsp)
        opts {:capabilities (default-capabilities)
              : handlers}
        au-group (vim.api.nvim_create_augroup :config_lspconfig {:clear true})]

    (vim.api.nvim_create_autocmd :LspAttach {:callback on-attach
                                             :group au-group})
    (vim.api.nvim_create_autocmd :ColorScheme {:callback update-colorscheme
                                               :group au-group})
    (update-colorscheme)

    (fennel.setup opts)
    (go.setup opts)
    (clojure.setup opts)
    (ts.setup opts)))

{: config}
