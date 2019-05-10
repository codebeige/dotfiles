augroup fireplace_autoload
	autocmd!
  autocmd FileType clojure packadd fireplace | autocmd! fireplace_autoload
augroup END
