augroup FireplacePlugin
  autocmd!

  autocmd Filetype clojure
        \ nnoremap <buffer> <localleader>r :Require<cr>|
        \ nnoremap <buffer> <localleader>R :Require!<cr>|
        \ nnoremap <silent><buffer> <localleader>t :RunTests<cr>:copen<cr>jk<c-w><c-p>|
        \ nnoremap <silent><buffer> <localleader>T :.RunTests<cr>:copen<cr>jk<c-w><c-p>

  autocmd BufNewFile,BufRead *.boot
        \ let b:fireplace_ns='boot.user'|
        \ nnoremap <buffer> <localleader>r :silent! %Eval<cr>

  autocmd BufNewFile,BufRead *.cljs
        \ command! -buffer -bar Brepl
        \ Piggieback (adzerk.boot-cljs-repl/repl-env)
  autocmd BufNewFile,BufRead *.cljs
        \ nnoremap <silent><buffer> <localleader>c :Brepl<cr>|
        \ nnoremap <silent><buffer> <localleader>C :Piggieback!<cr>
augroup END
