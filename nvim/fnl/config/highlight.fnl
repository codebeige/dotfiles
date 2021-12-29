(module config.highlight
  {autoload {a aniseed.core
             highlight lib.highlight
             nvim aniseed.nvim }
   require-macros [lib.macros]})

(defn- update-comments []
  (highlight.make-italic :Comment))

(defn- update-diagnostics []
  (nvim.ex.highlight :clear :DiagnosticError)
  (nvim.ex.highlight :link :DiagnosticError :ErrorMsg)
  (highlight.make-italic :DiagnosticVirtualTextError)
  (highlight.make-italic :DiagnosticVirtualTextWarn)
  (highlight.make-italic :DiagnosticVirtualTextInfo)
  (highlight.make-italic :DiagnosticVirtualTextHint))

(defn update-highlights []
  (update-comments)
  (update-diagnostics))

(augroup :config_highlight
  (autocmd :ColorScheme "*" update-highlights))

(update-highlights)
