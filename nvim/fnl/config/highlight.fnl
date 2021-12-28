(module config.highlight
  {autoload {nvim aniseed.nvim}
   require-macros [lib.macros]})

(defn update-highlights []
  (nvim.ex.highlight :Comment "gui=italic"))

(augroup :config_highlight
  (autocmd :ColorScheme "*" update-highlights))

(update-highlights)
