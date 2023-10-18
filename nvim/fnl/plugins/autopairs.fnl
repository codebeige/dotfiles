(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local autopairs (autoload :nvim-autopairs))
(local sexp (autoload :plugins.sexp))

(local disabled-filetypes
  (nfnl.concat ["" ; disable when filetype is unknown (e.g., during setup)
                "TelescopePrompt"]
               sexp.filetypes))

(fn config []
  (autopairs.setup {:check_ts true
                    :disable_filetype disabled-filetypes}))

{: config}
