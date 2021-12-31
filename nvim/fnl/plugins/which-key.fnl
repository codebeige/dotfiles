(module plugins.which-key
  {autoload {util lib.util
             which-key which-key}})

(defn config []
  (util.map "n" "<Leader><Leader>" "<Esc>")
  (util.map "n" "<Leader><C-L>" "<Esc>")
  (which-key.setup {:icons {:breadcrumb "∑"
                            :separator "→"}}))
