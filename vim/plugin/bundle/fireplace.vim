augroup FireplacePlugin
  autocmd!
  autocmd Filetype clojure
        \ nnoremap <buffer> <localleader>r :Require<cr>|
        \ nnoremap <buffer> <localleader>R :Require!<cr>|
        \ nnoremap <silent><buffer> <localleader>t :RunTests<cr>:copen<cr>jk<c-w><c-p>|
        \ nnoremap <silent><buffer> <localleader>T :.RunTests<cr>:copen<cr>jk<c-w><c-p>
augroup END
