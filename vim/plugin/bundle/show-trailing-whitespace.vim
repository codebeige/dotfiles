augroup show_trailing_whitespace
  autocmd!
  autocmd BufNewFile,BufRead COMMIT_EDITMSG call ShowTrailingWhitespace#Set(0,0)
augroup END

highlight ShowTrailingWhitespace ctermbg=red guibg=red
