augroup FireplacePlugin
  autocmd!
  autocmd Filetype clojure
        \ nnoremap <buffer> <localleader>r :Require<cr>|
        \ nnoremap <buffer> <localleader>R :Require!<cr>
  autocmd BufNewFile,BufRead,BufWrite *.clj[cx]\\\{,1\} try |
        \ silent! Require | catch /^Fireplace/ | endtry
augroup END
