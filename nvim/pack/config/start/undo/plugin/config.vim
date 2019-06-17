set undofile

augroup config_undo
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
