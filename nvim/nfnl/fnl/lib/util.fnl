(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local str (autoload :nfnl.string))

(fn set-opts [prefix opts]
  (each [k v (pairs opts)]
    (let [[scope prefix*] (str.split prefix ":")]
      (nfnl.assoc-in vim [scope (str.join "" [prefix* k])] v))))

(fn map [mode from to opts]
  (vim.api.nvim_set_keymap mode from to (nfnl.merge {:noremap true} opts)))

(fn map! [mode from to opts]
  (map mode from to (nfnl.assoc opts :silent true)))

(fn bmap [bufnr mode from to opts]
  (vim.api.nvim_buf_set_keymap bufnr mode from to (nfnl.merge {:noremap true} opts)))

(fn bmap! [bufnr mode from to opts]
  (bmap bufnr mode from to (nfnl.assoc opts :silent true)))

{: set-opts
 : map
 : map!
 : bmap
 : bmap!}
