(module colors
  {autoload {nvim aniseed.nvim}
   require-macros [lib.macros]})

(defn colorscheme-after []
  (nvim.ex.highlight :link :Whitespace :Special))

(augroup :init_colors
  (autocmd :ColorScheme "*" colorscheme-after))
