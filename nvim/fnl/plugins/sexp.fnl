(module plugins.sexp
  {autoload {str aniseed.string
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(def filetypes ["clojure" "fennel" "scheme" "lisp" "timl"])

(defn init []
  ; (which-key.register
  ;   {:s {:name "sexp"
  ;        "b" ["<Plug>(sexp_move_to_prev_bracket)" "Move to previous bracket"]}}
  ;   {:buffer 0
  ;    :mode ""
  ;    :prefix "<leader>"})
  (util.set-opts :b:debug_ {:init "123"})
  )

(defn setup []
  (util.set-opts :g:sexp_ {:filetypes ""})
  (augroup :plugins_sexp
    (autocmd :FileType (str.join "," filetypes) init)))
