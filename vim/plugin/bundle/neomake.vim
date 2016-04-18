let g:neomake_error_sign   = { 'text': '>>', 'texthl': 'NeomakeErrorSign'   }
let g:neomake_warning_sign = { 'text': '>>', 'texthl': 'NeomakeWarningSign' }

augroup NeomakePlugin
  autocmd!
  autocmd BufWritePost,BufEnter * Neomake
augroup END
