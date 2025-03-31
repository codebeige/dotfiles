(local highlight (require :lib.highlight))
(local ui (require :config.ui))

(local config
  {:float {:border ui.border}
   :virtual_text {:prefix "•"}
   :signs {:text {vim.diagnostic.severity.ERROR "!"
                  vim.diagnostic.severity.WARN  "*"
                  vim.diagnostic.severity.INFO  "~"
                  vim.diagnostic.severity.HINT  "?"}}})

(fn update-highlights []
  (highlight.unlink :DiagnosticSignError)
  (highlight.unlink :DiagnosticSignWarn)
  (highlight.unlink :DiagnosticSignInfo)
  (highlight.unlink :DiagnosticSignHint)

  (highlight.make-italic :DiagnosticError)
  (highlight.make-italic :DiagnosticWarn)
  (highlight.make-italic :DiagnosticInfo)
  (highlight.make-italic :DiagnosticHint))

(fn setup []
  (let [g (vim.api.nvim_create_augroup :config.diagnostic {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:callback (fn [_]
                                                           (update-highlights)
                                                           nil)
                                               :group g})
    (update-highlights))

  (vim.diagnostic.config config))

{: setup}
