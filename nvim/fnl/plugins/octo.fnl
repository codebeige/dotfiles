
(module plugins.octo
  {autoload {octo octo}})

(defn config []
  (octo.setup))
