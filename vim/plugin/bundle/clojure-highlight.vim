augroup clojure_highlight
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.clj[scx]\\\{,1\} ClojureHighlightReferences
augroup END
