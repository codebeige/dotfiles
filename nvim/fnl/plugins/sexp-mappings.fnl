(module plugins.sexp-mappings
  {autoload {which-key which-key}})

(def deep-merge (partial vim.tbl_deep_extend "keep"))

(def keymap-nxo
  {:B  "previous element head"
   :W  "next element head"
   :gE "previous element tail"
   :E  "next element tail"})

(def keymap-n
  {"<" {:name "backward"
        "(" "capture previous element"
        ")" "emit tail element"
        :I  "insert at form head"
        :e  "swap element backward"
        :f  "swap form backward"
            }
  ">" {:name "forward"
       "(" "emit head element"
       ")" "capture next element"
       :I  "insert at form tail"
       :e  "swap element forward"
       :f  "swap form forward"}})

(defn config []
  ; (each [mode keymap (pairs {:n (deep-merge keymap-nxo keymap-n)
  ;                            :x keymap-nxo
  ;                            :o keymap-nxo})]
  ;   (which-key.register keymap-nxo {:mode mode}))
  )

