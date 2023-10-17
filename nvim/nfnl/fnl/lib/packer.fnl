(local {: autoload} (require :nfnl.module))
(local packer (autoload :packer))
(local nfnl (autoload :nfnl.core))

(fn plugin [location opts]
  (nfnl.assoc opts 1 location))

(fn use [location opts]
  (packer.use (plugin location opts)))

(fn startup [f config]
  (packer.startup (fn [] (f use plugin)) config))

{: plugin
 : use
 : startup}
