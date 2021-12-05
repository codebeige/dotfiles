(module lib.packer
  {autoload {core aniseed.core
             env aniseed.env
             nvim aniseed.nvim
             packer packer}})

(defn use [config]
  (packer.startup
    (fn [use]
      (each [name opts (pairs config)]
        (when opts
          (let [opts* (if (core.table? opts) opts {})]
            (use (core.assoc opts* 1 name)))))
      (when nvim.g.pristine_env? (packer.sync)))))
