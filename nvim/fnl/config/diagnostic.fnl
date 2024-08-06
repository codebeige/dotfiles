(local {: autoload} (require :nfnl.module))
(local highlight (autoload :lib.highlight))
(local ui (autoload :config.ui))

(local signs {:Error "!"
              :Warn  "*"
              :Info  "~"
              :Hint  "?"})

(each [s t (pairs signs)]
  (let [name (.. :DiagnosticSign s)]
    (vim.fn.sign_define name {:text (.. " " t) :texthl name :numhl name})))

(fn update-highlights []
  (highlight.make-italic :DiagnosticError)
  (highlight.make-italic :DiagnosticWarn)
  (highlight.make-italic :DiagnosticInfo)
  (highlight.make-italic :DiagnosticHint))

(let [g (vim.api.nvim_create_augroup :config_diagnostic {:clear true})]
  (vim.api.nvim_create_autocmd :ColorScheme {:group g
                                             :pattern "*"
                                             :callback update-highlights}))

(update-highlights)

(vim.diagnostic.config {:float {:border ui.border}
                        :virtual_text {:prefix "•"}})
