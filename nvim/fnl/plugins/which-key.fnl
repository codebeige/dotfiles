(module plugins.which-key
  {autoload {which-key which-key}})

(defn setup []
  (which-key.setup {:icons {:breadcrumb "∑"
                            :separator "→"}}))
