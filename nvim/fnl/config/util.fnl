(module config.util
  {autoload {core aniseed.core
             str aniseed.string
             nvim aniseed.nvim}})

(defn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (core.assoc-in nvim [scope (str.join "" [prefix* k])] v))))
