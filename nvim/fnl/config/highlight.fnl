(local highlight (require :lib.highlight))

(fn update-highlights []
  (highlight.make-italic :Comment))

(fn init []
  (highlight.link :NormalFloat :Normal)
  (let [g (vim.api.nvim_create_augroup :config_highlight {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:group g
                                               :pattern "*"
                                               :callback update-highlights})
    (update-highlights)))

{: init}
