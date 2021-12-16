(module lib.util
  {autoload {a aniseed.core
             str aniseed.string
             nvim aniseed.nvim}})

(defn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (a.assoc-in nvim [scope (str.join "" [prefix* k])] v))))

(defn map [mode from to opts]
  (nvim.set_keymap mode from to (a.merge {:noremap true} opts)))

(defn map! [mode from to opts]
  (map mode from to (a.assoc opts :silent true)))

(defn bmap [bufnr mode from to opts]
  (nvim.buf_set_keymap bufnr mode from to (a.merge {:noremap true} opts)))

(defn bmap! [bufnr mode from to opts]
  (bmap bufnr mode from to (a.assoc opts :silent true)))
