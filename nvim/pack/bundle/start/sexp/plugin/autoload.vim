let g:sexp_filetypes = 'clojure,scheme,lisp,timl,fennel'

augroup sexp_autoload
	autocmd!
	execute 'autocmd FileType ' .
				\ g:sexp_filetypes .
				\ ' packadd sexp |' .
        \ ' packadd sexp-mappings-for-regular-people |' .
        \ ' autocmd! sexp_autoload'
augroup END
