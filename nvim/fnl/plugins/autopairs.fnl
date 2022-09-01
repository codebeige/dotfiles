(module plugins.autopairs
  {autoload {a aniseed.core
             autopairs nvim-autopairs
             sexp plugins.sexp}})

(def- disabled-filetypes
  (a.concat ["" ; disable when filetype is unknown (e.g., during setup)
             "TelescopePrompt"
             "cmp_menu"
             "spectre_panel"]
            sexp.filetypes))

(defn config []
  (autopairs.setup {:check_ts true
                    :disable_filetype disabled-filetypes}))
