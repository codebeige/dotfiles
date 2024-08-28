(local disabled-filetypes
  ["" ; disable when filetype is unknown (e.g., during setup)
   :TelescopePrompt
   :clojure :fennel :scheme :lisp :timl])

(fn config []
  (let [{: setup} (require :nvim-autopairs)]
    (setup {:check_ts true
            :disable_filetype disabled-filetypes})))

{: config}
