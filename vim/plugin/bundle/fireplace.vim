augroup FireplacePlugin
  autocmd!
  autocmd Filetype clojure
        \ nnoremap <buffer> <localleader>r :Require<cr>
        \ nnoremap <buffer> <localleader>R :Require!<cr>
augroup END
