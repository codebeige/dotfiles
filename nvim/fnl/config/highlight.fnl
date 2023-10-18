(local highlight (require :lib.highlight))

(fn update-highlights []
  (highlight.make-italic :Comment))

(let [g (vim.api.nvim_create_augroup :config_highlight {:clear true})]
  (vim.api.nvim_create_autocmd :ColorScheme {:group g
                                             :pattern "*"
                                             :callback update-highlights}))

(update-highlights)
