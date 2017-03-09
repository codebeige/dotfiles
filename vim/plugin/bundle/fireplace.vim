augroup FireplacePlugin
  autocmd!
  autocmd Filetype clojure
        \ nnoremap <buffer> <localleader>r :Require<cr>|
        \ nnoremap <buffer> <localleader>R :Require!<cr>
  autocmd BufRead,BufWrite *.clj[cx]\\\{,1\} try |
        \ silent! Require | catch /^Fireplace/ | endtry
  autocmd BufNewFile,BufRead *.clj[sc]
        \ nnoremap <buffer> <localleader>p
        \ :Piggieback (adzerk.boot-cljs-repl/repl-env)<cr>
augroup END
