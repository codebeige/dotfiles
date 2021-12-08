augroup fugitive_config
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
