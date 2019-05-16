augroup autoload_stylus
  autocmd!
  autocmd BufNewFile,BufReadPost *.styl,*.stylus
        \ packadd stylus |
        \ set filetype=stylus |
        \ autocmd! autoload_stylus
augroup END
