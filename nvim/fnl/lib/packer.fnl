  (module lib.packer
  {autoload {a aniseed.core
             packer packer}})

(defn plugin [location opts]
  (a.assoc opts 1 location))

(defn use [location opts]
  (packer.use (plugin location opts)))

(defn startup [f config]
  (packer.startup (fn [] (f use plugin)) config))
