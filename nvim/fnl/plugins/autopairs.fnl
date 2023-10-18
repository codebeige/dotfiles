(local {: autoload} (require :nfnl.module))
(local autopairs (autoload :nvim-autopairs))

(local disabled-filetypes
  ["" ; disable when filetype is unknown (e.g., during setup)
   :TelescopePrompt
   :clojure :fennel :scheme :lisp :timl])

(fn config []
  (autopairs.setup {:check_ts true
                    :disable_filetype disabled-filetypes}))

{1 :windwp/nvim-autopairs
 : config}
