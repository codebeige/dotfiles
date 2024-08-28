(local filetypes [:clojure :fennel :scheme :lisp :timl])

(fn register-keymaps [{: buf}]
  (let [which-key (require :which-key)]
  (which-key.add
    [{1 "=" :group "indent"}
     {1 "==" 2 "<Plug>(sexp_indent)"     :buffer buf :desc "indent form"}
     {1 "=-" 2 "<Plug>(sexp_indent_top)" :buffer buf :desc "indent root form"}

     {1 "<" :group "backward"}
     {1 "<(" 2 "<Plug>(sexp_capture_prev_element)"  :buffer buf :desc "capture previous element"}
     {1 "<)" 2 "<Plug>(sexp_emit_tail_element)"     :buffer buf :desc "emit tail element"}
     {1 "<e" 2 "<Plug>(sexp_swap_element_backward)" :buffer buf :desc "swap element backward"}
     {1 "<f" 2 "<Plug>(sexp_swap_list_backward)"    :buffer buf :desc "swap form backward"}
     {1 "<I" 2 "<Plug>(sexp_insert_at_list_head)"   :buffer buf :desc "insert at form head"}

     {1 ">" :group "forward"}
     {1 ">(" 2 "<Plug>(sexp_emit_head_element)"    :buffer buf :desc "emit head element"}
     {1 ">)" 2 "<Plug>(sexp_capture_next_element)" :buffer buf :desc "capture next element"}
     {1 ">e" 2 "<Plug>(sexp_swap_element_forward)" :buffer buf :desc "swap element forward"}
     {1 ">f" 2 "<Plug>(sexp_swap_list_forward)"    :buffer buf :desc "swap form forward"}
     {1 ">I" 2 "<Plug>(sexp_insert_at_list_tail)"  :buffer buf :desc "insert at form tail"}

     {1 "a" :group "around"}
     {1 "ae" 2 "<Plug>(sexp_outer_element)"  :buffer buf :desc "around element" :mode [:x :o]}
     {1 "af" 2 "<Plug>(sexp_outer_list)"     :buffer buf :desc "a form"         :mode [:x :o]}
     {1 "aF" 2 "<Plug>(sexp_outer_top_list)" :buffer buf :desc "a root form"    :mode [:x :o]}
     {1 "as" 2 "a\""                         :buffer buf :desc "around string"  :mode [:x :o]}

     {1 "i" :group "inner"}
     {1 "ie" 2 "<Plug>(sexp_inner_element)"  :buffer buf :desc "around element" :mode [:x :o]}
     {1 "if" 2 "<Plug>(sexp_inner_list)"     :buffer buf :desc "a form"         :mode [:x :o]}
     {1 "iF" 2 "<Plug>(sexp_inner_top_list)" :buffer buf :desc "a root form"    :mode [:x :o]}
     {1 "is" 2 "i\""                         :buffer buf :desc "around string"  :mode [:x :o]}

     {1 "[[" 2 "<Plug>(sexp_move_to_prev_top_element)"  :buffer buf :desc "previous root"         :mode [:n :x :o]}
     {1 "]]" 2 "<Plug>(sexp_move_to_next_top_element)"  :buffer buf :desc "next root"             :mode [:n :x :o]}
     {1 "("  2 "<Plug>(sexp_move_to_prev_bracket)"      :buffer buf :desc "previous bracket"      :mode [:n :x :o]}
     {1 ")"  2 "<Plug>(sexp_move_to_next_bracket)"      :buffer buf :desc "next bracket"          :mode [:n :x :o]}
     {1 "B"  2 "<Plug>(sexp_move_to_prev_element_head)" :buffer buf :desc "previous element head" :mode [:n :x :o]}
     {1 "W"  2 "<Plug>(sexp_move_to_next_element_head)" :buffer buf :desc "next element head"     :mode [:n :x :o]}
     {1 "gE" 2 "<Plug>(sexp_move_to_prev_element_tail)" :buffer buf :desc "previous element tail" :mode [:n :x :o]}
     {1 "E"  2 "<Plug>(sexp_move_to_next_element_tail)" :buffer buf :desc "next element tail"     :mode [:n :x :o]}

     {1 "<LocalLeader>x" :group "transform"}
     {1 "<LocalLeader>xd" 2 "<Plug>(sexp_splice_list)" :buffer buf :desc "splice form"}
     {1 "<LocalLeader>xs" 2 "<Plug>(sexp_convolute)"   :buffer buf :desc "convolute surrounding forms"}

     {1 "<LocalLeader>xo" :group "raise"}
     {1 "<LocalLeader>xoe" 2 "<Plug>(sexp_raise_element)" :buffer buf :desc "raise element"}
     {1 "<LocalLeader>xof" 2 "<Plug>(sexp_raise_list)"    :buffer buf :desc "raise form"}

     {1 "<LocalLeader>[" :group "previous"}
     {1 "<LocalLeader>[(" 2 "<Plug>(sexp_flow_to_prev_open)"      :buffer buf :desc "previous opening delimiter" :mode [:n :x]}
     {1 "<LocalLeader>[)" 2 "<Plug>(sexp_flow_to_prev_close)"     :buffer buf :desc "previous closing delimiter" :mode [:n :x]}
     {1 "<LocalLeader>[e" 2 "<Plug>(sexp_select_prev_element)"    :buffer buf :desc "select previous element"    :mode [:n :x]}
     {1 "<LocalLeader>[h" 2 "<Plug>(sexp_flow_to_prev_leaf_head)" :buffer buf :desc "previous leaf head"         :mode [:n :x]}
     {1 "<LocalLeader>[l" 2 "<Plug>(sexp_flow_to_prev_leaf_tail)" :buffer buf :desc "previous leaf tail"         :mode [:n :x]}

     {1 "<LocalLeader>]" :group "next"}
     {1 "<LocalLeader>](" 2 "<Plug>(sexp_flow_to_next_open)"      :buffer buf :desc "next opening delimiter" :mode [:n :x]}
     {1 "<LocalLeader>])" 2 "<Plug>(sexp_flow_to_next_close)"     :buffer buf :desc "next closing delimiter" :mode [:n :x]}
     {1 "<LocalLeader>]e" 2 "<Plug>(sexp_select_next_element)"    :buffer buf :desc "select next element"    :mode [:n :x]}
     {1 "<LocalLeader>]h" 2 "<Plug>(sexp_flow_to_next_leaf_head)" :buffer buf :desc "next leaf head"         :mode [:n :x]}
     {1 "<LocalLeader>]l" 2 "<Plug>(sexp_flow_to_next_leaf_tail)" :buffer buf :desc "next leaf tail"         :mode [:n :x]}

     {1 "<LocalLeader>w"  :group "wrap"}

     {1 "<LocalLeader>we" :group "element"}
     {1 "<LocalLeader>we(" 2 "<Plug>(sexp_round_head_wrap_element)"  :buffer buf :desc "wrap element round head"  :mode [:n :x]}
     {1 "<LocalLeader>we)" 2 "<Plug>(sexp_round_tail_wrap_element)"  :buffer buf :desc "wrap element round tail"  :mode [:n :x]}
     {1 "<LocalLeader>we[" 2 "<Plug>(sexp_square_head_wrap_element)" :buffer buf :desc "wrap element square head" :mode [:n :x]}
     {1 "<LocalLeader>we]" 2 "<Plug>(sexp_square_tail_wrap_element)" :buffer buf :desc "wrap element square tail" :mode [:n :x]}
     {1 "<LocalLeader>we{" 2 "<Plug>(sexp_curly_head_wrap_element)"  :buffer buf :desc "wrap element curly head"  :mode [:n :x]}
     {1 "<LocalLeader>we}" 2 "<Plug>(sexp_curly_tail_wrap_element)"  :buffer buf :desc "wrap element curly tail"  :mode [:n :x]}

     {1 "<LocalLeader>wf" :group "form"}
     {1 "<LocalLeader>wf(" 2 "<Plug>(sexp_round_head_wrap_list)"  :buffer buf :desc "wrap form round head"  :mode [:n :x]}
     {1 "<LocalLeader>wf)" 2 "<Plug>(sexp_round_tail_wrap_list)"  :buffer buf :desc "wrap form round tail"  :mode [:n :x]}
     {1 "<LocalLeader>wf[" 2 "<Plug>(sexp_square_head_wrap_list)" :buffer buf :desc "wrap form square head" :mode [:n :x]}
     {1 "<LocalLeader>wf]" 2 "<Plug>(sexp_square_tail_wrap_list)" :buffer buf :desc "wrap form square tail" :mode [:n :x]}
     {1 "<LocalLeader>wf{" 2 "<Plug>(sexp_curly_head_wrap_list)"  :buffer buf :desc "wrap form curly head"  :mode [:n :x]}
     {1 "<LocalLeader>wf}" 2 "<Plug>(sexp_curly_tail_wrap_list)"  :buffer buf :desc "wrap form curly tail"  :mode [:n :x]}])

    (vim.keymap.set :i "("    "<Plug>(sexp_insert_opening_round)"  {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "["    "<Plug>(sexp_insert_opening_square)" {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "{"    "<Plug>(sexp_insert_opening_curly)"  {:buffer buf :remap true :silent true})
    (vim.keymap.set :i ")"    "<Plug>(sexp_insert_closing_round)"  {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "]"    "<Plug>(sexp_insert_closing_square)" {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "}"    "<Plug>(sexp_insert_closing_curly)"  {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "\""   "<Plug>(sexp_insert_double_quote)"   {:buffer buf :remap true :silent true})
    (vim.keymap.set :i "<BS>" "<Plug>(sexp_insert_backspace)"      {:buffer buf :remap true :silent true})))

(fn init []
  (set vim.g.sexp_filetypes ""))

(fn config []
  (let [g (vim.api.nvim_create_augroup :plugins_sexp {:clear true})]
    (vim.api.nvim_create_autocmd :FileType {:callback register-keymaps
                                            :group g
                                            :pattern filetypes})))

{: config
 : filetypes
 : init}
