function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-j>
      \ pumvisible() ?
      \ "\<C-n>" :
      \ <SID>check_back_space() ?
      \ "\<C-j>" :
      \ coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nmap <silent> <localleader># :call CocAction('highlight')<cr>
nmap <localleader>rn <Plug>(coc-rename)
