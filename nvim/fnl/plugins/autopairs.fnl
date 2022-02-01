(module plugins.autopairs
  {autoload {autopairs nvim-autopairs}})

(defn config []
  (autopairs.setup {}))
