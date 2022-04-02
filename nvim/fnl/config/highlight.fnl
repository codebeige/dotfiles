(module config.highlight
  {autoload {highlight lib.highlight}
   require-macros [lib.macros]})

(defn update-highlights []
  (highlight.make-italic :Comment))

(augroup :config_highlight
  (autocmd :ColorScheme "*" update-highlights))

(update-highlights)
