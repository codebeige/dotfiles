if expand('%:t:r') =~# '_spec$'
  setlocal foldmethod=expr
  setlocal foldexpr=ruby#rspec_fold()
  setlocal foldtext=ruby#rspec_foldtext()
  normal zR
endif

