(module plugins.which-key
  {autoload {util lib.util
             which-key which-key}})

(defn config []
  (util.set-opts :o {:timeoutlen 500})
  (which-key.setup))
