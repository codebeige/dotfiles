(local highlight (require :lib.highlight))

(fn update-highlights []
  (highlight.make-italic :Comment)
  (vim.api.nvim_set_hl 0 :NormalFloat {:link :Normal})
  (vim.api.nvim_set_hl 0 :FloatBorder {:link :FloatNormal}))

(fn setup []
  (highlight.link :NormalFloat :Normal)
  (let [g (vim.api.nvim_create_augroup :config_highlight {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme {:group g
                                               :pattern "*"
                                               :callback update-highlights})
    (update-highlights)))

{: setup}
