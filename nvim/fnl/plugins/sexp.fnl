(local {: autoload} (require :nfnl.module))
(local lib (autoload :lib.core))
(local which-key (autoload :which-key))

(local filetypes [:clojure :fennel :scheme :lisp :timl])

(local keymaps-n
  {:= {:name "indent"
       := ["<Plug>(sexp_indent)" "indent form"]
       :- ["<Plug>(sexp_indent_top)" "indent root form"]}
   :< {:name "backward"
       "(" ["<Plug>(sexp_capture_prev_element)" "capture previous element"]
       ")" ["<Plug>(sexp_emit_tail_element)" "emit tail element"]
       :e  ["<Plug>(sexp_swap_element_backward)" "swap element backward"]
       :f  ["<Plug>(sexp_swap_list_backward)" "swap form backward"]
       :I  ["<Plug>(sexp_insert_at_list_head)" "insert at form head"]}
   :> {:name "forward"
       "(" ["<Pulg>(sexp_emit_head_element)" "emit head element"]
       ")" ["<Plug>(sexp_capture_next_element)" "capture next element"]
       :e  ["<Plug>(sexp_swap_element_forward)" "swap element forward"]
       :f  ["<Plug>(sexp_swap_list_forward)" "swap form forward"]
       :I  ["<Plug>(sexp_insert_at_list_tail)" "insert at form tail"]}})

(local keymaps-xo
  {:a {:name "around"
       :e ["<Plug>(sexp_outer_element)" "around element"]
       :f ["<Plug>(sexp_outer_list)" "a form"]
       :F ["<Plug>(sexp_outer_top_list)" "a root form"]
       :s ["a\"" "around string"]}
   :i {:name "inside"
       :e ["<Plug>(sexp_inner_element)" "inner element"]
       :f ["<Plug>(sexp_inner_list)" "inner form"]
       :F ["<Plug>(sexp_inner_top_list)" "inner root form"]
       :s ["i\"" "inner string"]}})

(local keymaps-nxo
  {"[" {"[" ["<Plug>(sexp_move_to_prev_top_element)" "previous root"]}
   "]" {"]" ["<Plug>(sexp_move_to_next_top_element)" "next root"]}
   "(" ["<Plug>(sexp_move_to_prev_bracket)" "previous bracket"]
   ")" ["<Plug>(sexp_move_to_next_bracket)" "next bracket"]
   :B  ["<Plug>(sexp_move_to_prev_element_head)" "previous element head"]
   :W  ["<Plug>(sexp_move_to_next_element_head)" "next element head"]
   :gE ["<Plug>(sexp_move_to_prev_element_tail)" "previous element tail"]
   :E  ["<Plug>(sexp_move_to_next_element_tail)" "next element tail"]})

(local keymaps-leader-n
  {:x {:name "transform"
       :d ["<Plug>(sexp_splice_list)" "splice form"]
       :o {:name "raise"
           :e ["<Plug>(sexp_raise_element)" "raise element"]
           :f ["<Plug>(sexp_raise_list)" "raise form"]}
       :s ["<Plug>(sexp_convolute)" "convolute surrounding forms"]}})

(local keymaps-leader-nx
  {"[" {"(" ["<Plug>(sexp_flow_to_prev_open)" "previous opening bracket"]
            ")" ["<Plug>(sexp_flow_to_prev_close)" "previous closing bracket"]
        :e ["<Plug>(sexp_select_prev_element)" "select previous element"]
        :h  ["<Plug>(sexp_flow_to_prev_leaf_head)" "previous leaf head"]
        :l  ["<Plug>(sexp_flow_to_prev_leaf_tail)" "previous leaf tail"]}
   "]" {"(" ["<Plug>(sexp_flow_to_next_open)" "next opening bracket"]
        ")" ["<Plug>(sexp_flow_to_next_close)" "next closing bracket"]
        :e ["<Plug>(sexp_select_next_element)" "select next element"]
        :h  ["<Plug>(sexp_flow_to_next_leaf_head)" "next leaf head"]
        :l  ["<Plug>(sexp_flow_to_next_leaf_tail)" "next leaf tail"]}
   :w {:name "wrap"
       :e {:name "element"
           "(" ["<Plug>(sexp_round_head_wrap_element)" "wrap element round head"]
           ")" ["<Plug>(sexp_round_tail_wrap_element)" "wrap element round tail"]
           "[" ["<Plug>(sexp_square_head_wrap_element)" "wrap element square head"]
           "]" ["<Plug>(sexp_square_tail_wrap_element)" "wrap element square tail"]
           "{" ["<Plug>(sexp_curly_head_wrap_element)" "wrap element curly head"]
           "}" ["<Plug>(sexp_curly_tail_wrap_element)" "wrap element curly tail"]}
       :f {:name "form"
           "(" ["<Plug>(sexp_round_head_wrap_list)" "wrap form round head"]
           ")" ["<Plug>(sexp_round_tail_wrap_list)" "wrap form round tail"]
           "[" ["<Plug>(sexp_square_head_wrap_list)" "wrap form square head"]
           "]" ["<Plug>(sexp_square_tail_wrap_list)" "wrap form square tail"]
           "{" ["<Plug>(sexp_curly_head_wrap_list)" "wrap form curly head"]
           "}" ["<Plug>(sexp_curly_tail_wrap_list)" "wrap form curly tail"]}}})

(local insert-mode-mappings
  {"(" "<Plug>(sexp_insert_opening_round)"
   "[" "<Plug>(sexp_insert_opening_square)"
   "{" "<Plug>(sexp_insert_opening_curly)"
   ")" "<Plug>(sexp_insert_closing_round)"
   "]" "<Plug>(sexp_insert_closing_square)"
   "}" "<Plug>(sexp_insert_closing_curly)"
   "\"" "<Plug>(sexp_insert_double_quote)"
   "<BS>" "<Plug>(sexp_insert_backspace)"})

(fn register-keymaps [args]
  (let [bufnr (vim.api.nvim_get_current_buf)]
    (each [mode keymap (pairs {:n (lib.deep-merge keymaps-n
                                                  keymaps-nxo)
                               :x (lib.deep-merge keymaps-xo
                                                  keymaps-nxo)
                               :o (lib.deep-merge keymaps-xo
                                                  keymaps-nxo)})]
      (which-key.register keymap {:buffer bufnr :mode mode}))

    (each [mode keymap (pairs {:n (lib.deep-merge keymaps-leader-n
                                                  keymaps-leader-nx)
                               :x keymaps-leader-nx})]
      (which-key.register keymap {:buffer bufnr
                                  :mode mode
                                  :prefix "<LocalLeader>"}))

    (each [lhs rhs (pairs insert-mode-mappings)]
      (vim.keymap.set :i lhs rhs {:buffer true :remap true :silent true}))))

(fn setup []
  (set vim.g.sexp_filetypes "")
  (let [g (vim.api.nvim_create_augroup :plugins_sexp {:clear true})]
    (vim.api.nvim_create_autocmd :FileType {:callback register-keymaps
                                            :group g
                                            :pattern filetypes})))

{: filetypes
 : setup}
