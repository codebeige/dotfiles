nmap <Leader>' <Plug>(iced_connect)

  "" Evaluating (<Leader>e)
  "" ------------------------------------------------------------------------
nmap <Leader>eq <Plug>(iced_interrupt)
nmap <Leader>eQ <Plug>(iced_interrupt_all)
nmap <Leader>" <Plug>(iced_jack_in)

nmap <Leader>ei <Plug>(iced_eval)<Plug>(sexp_inner_element)``
nmap <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
nmap <Leader>et <Plug>(iced_eval_outer_top_list)

nmap <Leader>ea <Plug>(iced_eval_at_mark)
nmap <Leader>el <Plug>(iced_eval_last_outer_top_list)
vmap <Leader>ee <Plug>(iced_eval_visual)
nmap <Leader>en <Plug>(iced_eval_ns)
nmap <Leader>ep <Plug>(iced_print_last)
nmap <Leader>eb <Plug>(iced_require)
nmap <Leader>eB <Plug>(iced_require_all)
nmap <Leader>eu <Plug>(iced_undef)
nmap <Leader>eU <Plug>(iced_undef_all_in_ns)
nmap <Leader>eM <Plug>(iced_macroexpand_outer_list)
nmap <Leader>em <Plug>(iced_macroexpand_1_outer_list)

  "" Testing (<Leader>t)
  "" ------------------------------------------------------------------------
nmap <Leader>tt <Plug>(iced_test_under_cursor)
nmap <Leader>tl <Plug>(iced_test_rerun_last)
nmap <Leader>ts <Plug>(iced_test_spec_check)
nmap <Leader>to <Plug>(iced_test_buffer_open)
nmap <Leader>tn <Plug>(iced_test_ns)
nmap <Leader>tp <Plug>(iced_test_all)
nmap <Leader>tr <Plug>(iced_test_redo)

  "" Stdout buffer (<Leader>s)
  "" ------------------------------------------------------------------------
nmap <Leader>ss <Plug>(iced_stdout_buffer_toggle)
nmap <Leader>sl <Plug>(iced_stdout_buffer_clear)
nmap <Leader>so <Plug>(iced_stdout_buffer_open)
nmap <Leader>sq <Plug>(iced_stdout_buffer_close)

  "" Refactoring (<Leader>r)
  "" ------------------------------------------------------------------------
nmap <Leader>rcn <Plug>(iced_clean_ns)
nmap <Leader>rca <Plug>(iced_clean_all)
nmap <Leader>ram <Plug>(iced_add_missing)
nmap <Leader>ran <Plug>(iced_add_ns)
nmap <Leader>rtf <Plug>(iced_thread_first)
nmap <Leader>rtl <Plug>(iced_thread_last)
nmap <Leader>ref <Plug>(iced_extract_function)
nmap <Leader>raa <Plug>(iced_add_arity)
nmap <Leader>rml <Plug>(iced_move_to_let)
nmap <Leader>rrs <Plug>(iced_rename_symbol)

  "" Help/Document (<Leader>h)
  "" ------------------------------------------------------------------------
nmap <Leader>K  <Plug>(iced_document_popup_open)
nmap <Leader>hb <Plug>(iced_document_open)
nmap <Leader>hu <Plug>(iced_use_case_open)
nmap <Leader>hn <Plug>(iced_next_use_case)
nmap <Leader>hN <Plug>(iced_prev_use_case)
nmap <Leader>hq <Plug>(iced_document_close)
nmap <Leader>hS <Plug>(iced_source_show)
nmap <Leader>hs <Plug>(iced_source_popup_show)
nmap <Leader>hc <Plug>(iced_clojuredocs_open)
nmap <Leader>hh <Plug>(iced_command_palette)

  "" Browsing (<Leader>b)
  "" ------------------------------------------------------------------------
nmap <Leader>bn <Plug>(iced_browse_related_namespace)
nmap <Leader>bs <Plug>(iced_browse_spec)
nmap <Leader>bt <Plug>(iced_browse_test_under_cursor)
nmap <Leader>br <Plug>(iced_browse_references)
nmap <Leader>bd <Plug>(iced_browse_dependencies)

  "" Jumping cursor (<Leader>j)
  "" ------------------------------------------------------------------------
nmap <Leader>jd <Plug>(iced_def_jump)
nmap <Leader>jn <Plug>(iced_jump_to_next_sign)
nmap <Leader>jN <Plug>(iced_jump_to_prev_sign)
nmap <Leader>jl <Plug>(iced_jump_to_let)

  "" Debugging (<Leader>d)
  "" ------------------------------------------------------------------------
nmap <Leader>dbt <Plug>(iced_browse_tapped)
nmap <Leader>dlt <Plug>(iced_clear_tapped)

  "" Misc
  "" ------------------------------------------------------------------------
nmap <Leader>== <Plug>(iced_format)
nmap <Leader>=G <Plug>(iced_format_all)
nmap <Leader>* <Plug>(iced_grep)
nmap <Leader>/ :<C-u>IcedGrep<Space>
nmap <Leader>yn <Plug>(iced_yank_ns_name)
