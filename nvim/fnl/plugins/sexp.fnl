(module plugins.sexp
  {autoload {str aniseed.string
             util lib.util}
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

(def- mappings
  {:sexp_outer_list                "af"
   :sexp_inner_list                "if"
   :sexp_outer_top_list            "aF"
   :sexp_inner_top_list            "iF"
   :sexp_outer_string              "as"
   :sexp_inner_string              "is"
   :sexp_outer_element             "ae"
   :sexp_inner_element             "ie"
   :sexp_move_to_prev_bracket      "("
   :sexp_move_to_next_bracket      ")"
   :sexp_move_to_prev_element_head "<M-b>"
   :sexp_move_to_next_element_head "<M-w>"
   :sexp_move_to_prev_element_tail "g<M-e>"
   :sexp_move_to_next_element_tail "<M-e>"
   :sexp_flow_to_prev_close        "<M-[>"
   :sexp_flow_to_next_open         "<M-]>"
   :sexp_flow_to_prev_open         "<M-{>"
   :sexp_flow_to_next_close        "<M-}>"
   :sexp_flow_to_prev_leaf_head    "<M-S-b>"
   :sexp_flow_to_next_leaf_head    "<M-S-w>"
   :sexp_flow_to_prev_leaf_tail    "<M-S-g>"
   :sexp_flow_to_next_leaf_tail    "<M-S-e>"
   :sexp_move_to_prev_top_element  "[["
   :sexp_move_to_next_top_element  "]]"
   :sexp_select_prev_element       "[e"
   :sexp_select_next_element       "]e"
   :sexp_indent                    "=="
   :sexp_indent_top                "=-"
   :sexp_round_head_wrap_list      "<LocalLeader>i"
   :sexp_round_tail_wrap_list      "<LocalLeader>I"
   :sexp_square_head_wrap_list     "<LocalLeader>["
   :sexp_square_tail_wrap_list     "<LocalLeader>]"
   :sexp_curly_head_wrap_list      "<LocalLeader>{"
   :sexp_curly_tail_wrap_list      "<LocalLeader>}"
   :sexp_round_head_wrap_element   "<LocalLeader>w"
   :sexp_round_tail_wrap_element   "<LocalLeader>W"
   :sexp_square_head_wrap_element  "<LocalLeader>e["
   :sexp_square_tail_wrap_element  "<LocalLeader>e]"
   :sexp_curly_head_wrap_element   "<LocalLeader>e{"
   :sexp_curly_tail_wrap_element   "<LocalLeader>e}"
   :sexp_insert_at_list_head       "<LocalLeader>h"
   :sexp_insert_at_list_tail       "<LocalLeader>l"
   :sexp_splice_list               "<LocalLeader>@"
   :sexp_convolute                 "<LocalLeader>?"
   :sexp_raise_list                "<LocalLeader>o"
   :sexp_raise_element             "<LocalLeader>O"
   :sexp_swap_list_backward        "<M-k>"
   :sexp_swap_list_forward         "<M-j>"
   :sexp_swap_element_backward     "<M-h>"
   :sexp_swap_element_forward      "<M-l>"
   :sexp_emit_head_element         "<M-S-j>"
   :sexp_emit_tail_element         "<M-S-k>"
   :sexp_capture_prev_element      "<M-S-h>"
   :sexp_capture_next_element      "<M-S-l>"})

(defn setup []
    (util.set-opts :g:sexp_ {:enable_insert_mode_mappings false
                             :filetypes (str.join "," filetypes)}))
