(module lib.packer
  {autoload {a aniseed.core
             env aniseed.env
             nvim aniseed.nvim
             packer packer}})

(defn use [config]
  (packer.startup
    (fn [use]
      (each [name opts (pairs config)]
        (when opts
          (let [opts* (if (a.table? opts) opts {})]
            (use (a.assoc opts* 1 name)))))
      (when nvim.g.pristine_env? (packer.sync)))))
