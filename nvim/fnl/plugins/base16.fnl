(module plugins.base16
  {autoload {nvim aniseed.nvim}})

(defn config []
  (nvim.ex.colorscheme :base16-tomorrow-night-eighties))
