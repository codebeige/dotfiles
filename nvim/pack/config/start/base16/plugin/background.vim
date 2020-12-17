augroup CustomizeColorScheme
  autocmd!
  autocmd ColorScheme * call colorscheme#customize()
augroup END

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
