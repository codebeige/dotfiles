(module lib.packer
  {autoload {a aniseed.core
             env aniseed.env
             nvim aniseed.nvim
             packer packer}})

(defn plugin [location config]
  (match config
    true location
    false (a.assoc {:disable true} 1 location)
    {} (if (next config) (a.assoc config 1 location) location)
    _ (error (string.format "Invalid plugin configuration: %s"
                            (vim.inspect config)))))

(defn use [config]
  (packer.startup
    (fn [use]
      (each [k v (pairs config)] (use (plugin k v))))))
