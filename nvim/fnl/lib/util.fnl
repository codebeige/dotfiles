(module lib.util
  {autoload {core aniseed.core
             str aniseed.string
             nvim aniseed.nvim}})

(defn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (core.assoc-in nvim [scope (str.join "" [prefix* k])] v))))

(defn map [from to]
  (nvim.set_keymap "" from to {}))

(defn noremap [mode from to opts]
  (nvim.set_keymap mode from to (core.assoc opts :noremap true)))

(defn noremap! [mode from to opts]
  (noremap mode from to (core.assoc opts :silent true)))
