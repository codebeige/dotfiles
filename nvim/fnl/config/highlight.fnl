(local highlight (require :lib.highlight))

(fn update-highlights []
  (highlight.make-italic :Comment)
  (vim.api.nvim_set_hl 0 :NormalFloat {:link :Normal})
  (vim.api.nvim_set_hl 0 :FloatBorder {:link :FloatNormal})
  (vim.api.nvim_set_hl 0 :MatchParen {:link :Visual}))

(fn setup []
  (highlight.link :NormalFloat :Normal)
  (let [group (vim.api.nvim_create_augroup :config.highlight {:clear true})]
    (vim.api.nvim_create_autocmd :ColorScheme
                                 {:callback (fn [_]
                                              (update-highlights)
                                              nil)
                                  : group})
    (update-highlights)))

{: setup}
