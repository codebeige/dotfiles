augroup clojure_highlight
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.clj[cx]\\\{,1\} ClojureHighlightReferences
augroup END
