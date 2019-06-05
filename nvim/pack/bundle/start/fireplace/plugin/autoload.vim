if exists("g:loaded_autoload_fireplace")
  finish
endif
let g:loaded_autoload_fireplace = 1

augroup fireplace_autoload
	autocmd!
  autocmd BufNewFile,BufRead *.clj,*.cljc
        \ packadd fireplace |
        \ autocmd! fireplace_autoload
augroup END
