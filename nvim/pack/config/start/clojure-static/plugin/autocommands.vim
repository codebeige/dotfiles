augroup clojure_static_cljs
  autocmd!
  autocmd BufNewFile,BufRead *_test.cljs setlocal lispwords+=async
  autocmd BufNewFile,BufRead *.clj_kondo setlocal filetype=clojure
augroup END
