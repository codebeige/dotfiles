let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v^%(\..*|node_modules|log|tmp)$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles = 0
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_arg_map = 1
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()': ['<F5>', '<c-g>'],
  \ 'PrtExit()':       ['<esc>', '<c-c>'],
  \ }

let g:ctrlp_working_path_mode = 'ra'
