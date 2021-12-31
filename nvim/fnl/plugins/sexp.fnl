(module plugins.sexp
  {autoload {str aniseed.string
             util lib.util}})

(def filetypes ["clojure" "fennel" "scheme" "lisp" "timl"])

(defn setup []
  (util.set-opts :g:sexp_ {:filetypes (str.join "," filetypes)}))
