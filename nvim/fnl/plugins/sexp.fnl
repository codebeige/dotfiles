(module plugins.sexp
  {autoload {str aniseed.string
             util lib.util}
   require-macros [lib.macros]})

(def filetypes [:clojure :fennel :scheme :lisp :timl])

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
   :sexp_move_to_prev_element_head "B"
   :sexp_move_to_next_element_head "W"
   :sexp_move_to_prev_element_tail "gE"
   :sexp_move_to_next_element_tail "E"
   :sexp_flow_to_prev_close        "<LocalLeader>s["
   :sexp_flow_to_next_open         "<LocalLeader>s]"
   :sexp_flow_to_prev_open         "<LocalLeader>s{"
   :sexp_flow_to_next_close        "<LocalLeader>s}"
   :sexp_flow_to_prev_leaf_head    "<LocalLeader>sb"
   :sexp_flow_to_next_leaf_head    "<LocalLeader>sw"
   :sexp_flow_to_prev_leaf_tail    "<LocalLeader>sg"
   :sexp_flow_to_next_leaf_tail    "<LocalLeader>se"
   :sexp_move_to_prev_top_element  "[["
   :sexp_move_to_next_top_element  "]]"
   :sexp_select_prev_element       "[e"
   :sexp_select_next_element       "]e"
   :sexp_indent                    "=="
   :sexp_indent_top                "=-"
   :sexp_round_head_wrap_list      "<LocalLeader>sf("
   :sexp_round_tail_wrap_list      "<LocalLeader>sf)"
   :sexp_square_head_wrap_list     "<LocalLeader>sf["
   :sexp_square_tail_wrap_list     "<LocalLeader>sf]"
   :sexp_curly_head_wrap_list      "<LocalLeader>sf{"
   :sexp_curly_tail_wrap_list      "<LocalLeader>sf}"
   :sexp_round_head_wrap_element   "<LocalLeader>se("
   :sexp_round_tail_wrap_element   "<LocalLeader>se)"
   :sexp_square_head_wrap_element  "<LocalLeader>se["
   :sexp_square_tail_wrap_element  "<LocalLeader>se]"
   :sexp_curly_head_wrap_element   "<LocalLeader>se{"
   :sexp_curly_tail_wrap_element   "<LocalLeader>se}"
   :sexp_insert_at_list_head       "<I"
   :sexp_insert_at_list_tail       ">I"
   :sexp_splice_list               "dsf"
   :sexp_convolute                 "<LocalLeader>sfx"
   :sexp_raise_list                "<LocalLeader>sfo"
   :sexp_raise_element             "<LocalLeader>seo"
   :sexp_swap_list_backward        "<f"
   :sexp_swap_list_forward         ">f"
   :sexp_swap_element_backward     "<e"
   :sexp_swap_element_forward      ">e"
   :sexp_emit_head_element         ">("
   :sexp_emit_tail_element         "<)"
   :sexp_capture_prev_element      "<("
   :sexp_capture_next_element      ">)"})

(defn setup []
  (util.set-opts :g:sexp_ {:enable_insert_mode_mappings false
                           :filetypes (str.join "," filetypes)}))
