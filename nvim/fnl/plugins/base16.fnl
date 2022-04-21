(module plugins.base16
  {autoload {a aniseed.core
             str aniseed.string
             nvim aniseed.nvim}})

(def- colorscheme-file
  (a.str (os.getenv :HOME) "/.colortheme"))

(defn- current []
  (match (a.slurp colorscheme-file true)
    name (-> name str.trim (string.gsub "-256$" ""))
    _ :base16-tomorrow-night-eighties))

(defn- update []
  (let [name (current)]
    (when (not= name vim.g.colors_name) (nvim.ex.colorscheme name))))

(defn config []
  (update))
