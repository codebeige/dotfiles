let g:ctrlp_custom_ignore = '\v[\/]stats$'
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles = 0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir']
let g:ctrlp_arg_map = 1
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()': ['<F5>', '<c-g>'],
  \ 'PrtExit()':       ['<esc>', '<c-c>'],
  \ }
