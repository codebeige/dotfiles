(module lib.util
  {autoload {core aniseed.core
             str aniseed.string
             nvim aniseed.nvim}})

(defn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (core.assoc-in nvim [scope (str.join "" [prefix* k])] v))))

(defn map [mode from to opts]
  (nvim.set_keymap mode from to (core.merge {:noremap true} opts)))

(defn map! [mode from to opts]
  (map mode from to (core.assoc opts :silent true)))

(defn bmap [bufnr mode from to opts]
  (nvim.buf_set_keymap bufnr mode from to (core.merge {:noremap true} opts)))

(defn bmap! [bufnr mode from to opts]
  (bmap bufnr mode from to (core.assoc opts :silent true)))
