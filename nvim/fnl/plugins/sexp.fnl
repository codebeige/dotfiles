(module plugins.sexp
  {autoload {str aniseed.string
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(def filetypes [:clojure :fennel :scheme :lisp :timl])

(def deep-merge (partial vim.tbl_deep_extend "keep"))

(def keymaps-xo
  {:a {:e ["<Plug>(sexp_outer_element)" "outer element"]
       :f ["<Plug>(sexp_outer_list)" "outer form"]
       :F ["<Plug>(sexp_outer_top_list)" "outer root form"]}
  :i {:e ["<Plug>(sexp_inner_elemen)" "inner element"]
      :f ["<Plug>(sexp_inner_list)" "inner form"]
      :F ["<Plug>(sexp_inner_top_list)" "inner root form"]}})

(def keymaps-nxo
{"[" {:name "previous"
        :b ["<Plug>(sexp_move_to_prev_bracket)" "previous bracket"]
        :e ["<Plug>(sexp_select_prev_element)" "select previous element"]}
   "]" {:name "next"
        :b ["<Plug>(sexp_move_to_next_bracket)" "next bracket"]
        :e ["<Plug>(sexp_select_next_element)" "select next element"]}})

(def prefix "<LocalLeader>")

(def keymaps-n
  {:= {:name "indent"
       :r ["<Plug>(sexp_indent_top)" "indentet root form"]
       :f ["<Plug>(sexp_indent)" "indent form"]}
   :w {:name "wrap"
       :e {:name "element"
           "(" ["<Plug>(sexp_round_head_wrap_element)" "wrap element round head"]
           ")" ["<Plug>(sexp_round_tail_wrap_element)" "wrap element round tail"]
           "[" ["<Plug>(sexp_square_head_wrap_element)" "wrap element square head"]
           "]" ["<Plug>(sexp_square_tail_wrap_element)" "wrap element square tail"]
           "{" ["<Plug>(sexp_curly_head_wrap_element)" "wrap element curly head"]
           "}" ["<Plug>(sexp_curly_tail_wrap_element)" "wrap element curly tail"] }
       :f {:name "form"
           "(" ["<Plug>(sexp_round_head_wrap_list)" "wrap form round head"]
           ")" ["<Plug>(sexp_round_tail_wrap_list)" "wrap form round tail"]
           "[" ["<Plug>(sexp_square_head_wrap_list)" "wrap form square head"]
           "]" ["<Plug>(sexp_square_tail_wrap_list)" "wrap form square tail"]
           "{" ["<Plug>(sexp_curly_head_wrap_list)" "wrap form curly head"]
           "}" ["<Plug>(sexp_curly_tail_wrap_list)" "wrap form curly tail"]}}
   :x {:name "transform"
       :d ["<Plug>(sexp_splice_list)" "splice form"]
       :o ["<Plug>(sexp_raise_list)" "raise form"]
       :r ["<Plug>(sexp_raise_element)" "raise element"]
       :x ["<Plug>(sexp_convolute)" "convolute surrounding forms"]}})

(def keymaps-nx
  {"]" {:name "next"
        :h ["<Plug>(sexp_flow_to_next_leaf_head)" "next leaf head"]
        :j ["<Plug>(sexp_flow_to_next_close)" "next closing bracket"]
        :k ["<Plug>(sexp_flow_to_next_close)" "next opening bracket"]
        :l ["<Plug>(sexp_flow_to_next_leaf_tail)" "next leaf tail"]
        :r ["<Plug>(sexp_move_to_next_top_element)" "next root"]}
   "]" {:name "previous"
        :h ["<Plug>(sexp_flow_to_prev_leaf_head)" "previous leaf head"]
        :j ["<Plug>(sexp_flow_to_prev_close)" "previous closing bracket"]
        :k ["<Plug>(sexp_flow_to_prev_close)" "previous opening bracket"]
        :l ["<Plug>(sexp_flow_to_prev_leaf_tail)" "previous leaf tail"]
        :r ["<Plug>(sexp_move_to_prev_top_element)" "previous root"]}})

(def keymaps-x
  {:w {:name "wrap"
       "(" ["<Plug>(sexp_round_head_wrap_element)" "wrap selection round head"]
       ")" ["<Plug>(sexp_round_tail_wrap_element)" "wrap selection round tail"]
       "[" ["<Plug>(sexp_square_head_wrap_element)" "wrap selection square head"]
       "]" ["<Plug>(sexp_square_tail_wrap_element)" "wrap selection square tail"]
       "{" ["<Plug>(sexp_curly_head_wrap_element)" "wrap selection curly head"]
       "}" ["<Plug>(sexp_curly_tail_wrap_element)" "wrap selection curly tail"]}})

(defn init [args]
  (each [mode keymap (pairs {:n keymaps-nxo
                             :x (deep-merge keymaps-xo keymaps-nxo)
                             :o (deep-merge keymaps-xo keymaps-nxo)})]
    (which-key.register keymap {:buffer 0 :mode mode :noremap false}))

  (each [mode keymap (pairs {:n (deep-merge keymaps-n keymaps-nx)
                             :x (deep-merge keymaps-nx keymaps-x)})]
    (which-key.register keymap {:buffer 0 :mode mode :prefix prefix :noremap false})))

(defn setup []
  (util.set-opts :g:sexp_ {:filetypes ""})
  (augroup :plugins_sexp (autocmd :FileType (str.join "," filetypes) init)))
