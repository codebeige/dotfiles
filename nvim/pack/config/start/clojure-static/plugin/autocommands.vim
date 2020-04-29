augroup clojure_static_cljs
  autocmd!
  autocmd BufNewFile,BufRead *_test.cljs setlocal lispwords+=async
augroup END
