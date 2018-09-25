if exists("g:loaded_sexp_custom_mappings") || &cp
  finish
endif
let g:loaded_sexp_custom_mappings = 1

let g:sexp_mappings = {
			\ 'sexp_move_to_prev_element_head': '',
			\ 'sexp_move_to_next_element_head': '',
			\ 'sexp_move_to_prev_element_tail': '',
			\ 'sexp_move_to_next_element_tail': '',
			\ 'sexp_flow_to_prev_close':        '',
			\ 'sexp_flow_to_next_open':         '',
			\ 'sexp_flow_to_prev_open':         '',
			\ 'sexp_flow_to_next_close':        '',
			\ 'sexp_flow_to_prev_leaf_head':    '',
			\ 'sexp_flow_to_next_leaf_head':    '',
			\ 'sexp_flow_to_prev_leaf_tail':    '',
			\ 'sexp_flow_to_next_leaf_tail':    '',
			\ 'sexp_swap_list_backward':        '',
			\ 'sexp_swap_list_forward':         '',
			\ 'sexp_swap_element_backward':     '',
			\ 'sexp_swap_element_forward':      '',
			\ 'sexp_emit_head_element':         '',
			\ 'sexp_emit_tail_element':         '',
			\ 'sexp_capture_prev_element':      '',
			\ 'sexp_capture_next_element':      '',
			\ }

function! s:setup() abort
	nmap <silent><buffer> öö <Plug>(sexp_move_to_prev_top_element)
	xmap <silent><buffer> öö <Plug>(sexp_move_to_prev_top_element)
	omap <silent><buffer> öö <Plug>(sexp_move_to_prev_top_element)

	nmap <silent><buffer> ää <Plug>(sexp_move_to_next_top_element)
	xmap <silent><buffer> ää <Plug>(sexp_move_to_next_top_element)
	omap <silent><buffer> ää <Plug>(sexp_move_to_next_top_element)

	nmap <silent><buffer> <LocalLeader>ö <Plug>(sexp_square_head_wrap_list)
	xmap <silent><buffer> <LocalLeader>ö <Plug>(sexp_square_head_wrap_list)

	nmap <silent><buffer> <LocalLeader>ä <Plug>(sexp_square_tail_wrap_list)
	xmap <silent><buffer> <LocalLeader>ä <Plug>(sexp_square_tail_wrap_list)

	nmap <silent><buffer> <LocalLeader>Ö <Plug>(sexp_curly_head_wrap_list)
	xmap <silent><buffer> <LocalLeader>Ö <Plug>(sexp_curly_head_wrap_list)

	nmap <silent><buffer> <LocalLeader>Ä <Plug>(sexp_curly_tail_wrap_list)
	xmap <silent><buffer> <LocalLeader>Ä <Plug>(sexp_curly_tail_wrap_list)

  nmap <silent><buffer> <LocalLeader>eö <Plug>(sexp_square_head_wrap_element)
	xmap <silent><buffer> <LocalLeader>eö <Plug>(sexp_square_head_wrap_element)

	nmap <silent><buffer> <LocalLeader>eä <Plug>(sexp_square_tail_wrap_element)
	xmap <silent><buffer> <LocalLeader>eä <Plug>(sexp_square_tail_wrap_element)

	nmap <silent><buffer> <LocalLeader>eÖ <Plug>(sexp_curly_head_wrap_element)
	xmap <silent><buffer> <LocalLeader>eÖ <Plug>(sexp_curly_head_wrap_element)

	nmap <silent><buffer> <LocalLeader>eÄ <Plug>(sexp_curly_tail_wrap_element)
	xmap <silent><buffer> <LocalLeader>eÄ <Plug>(sexp_curly_tail_wrap_element)

	nmap <silent><buffer> <C-j> <Plug>(sexp_flow_to_next_open)
	xmap <silent><buffer> <C-j> <Plug>(sexp_flow_to_next_open)

	nmap <silent><buffer> <C-k> <Plug>(sexp_flow_to_prev_open)
	xmap <silent><buffer> <C-k> <Plug>(sexp_flow_to_prev_open)

	nmap <silent><buffer> <C-h> <Plug>(sexp_flow_to_prev_leaf_head)
	xmap <silent><buffer> <C-h> <Plug>(sexp_flow_to_prev_leaf_head)

	nmap <silent><buffer> <C-l> <Plug>(sexp_flow_to_next_leaf_head)
	xmap <silent><buffer> <C-l> <Plug>(sexp_flow_to_next_leaf_head)

	nmap <silent><buffer> g<C-j> <Plug>(sexp_flow_to_next_close)
	xmap <silent><buffer> g<C-j> <Plug>(sexp_flow_to_next_close)

	nmap <silent><buffer> g<C-k> <Plug>(sexp_flow_to_prev_close)
	xmap <silent><buffer> g<C-k> <Plug>(sexp_flow_to_prev_close)

	nmap <silent><buffer> g<C-h> <Plug>(sexp_flow_to_prev_leaf_tail)
	xmap <silent><buffer> g<C-h> <Plug>(sexp_flow_to_prev_leaf_tail)

	nmap <silent><buffer> g<C-l> <Plug>(sexp_flow_to_next_leaf_tail)
	xmap <silent><buffer> g<C-l> <Plug>(sexp_flow_to_next_leaf_tail)
endfunction

augroup sexp_custom_mappings
	autocmd!
	execute 'autocmd FileType' get(g:, 'sexp_filetypes', 'clojure,scheme,lisp,timl') 'call s:setup()'
augroup END
