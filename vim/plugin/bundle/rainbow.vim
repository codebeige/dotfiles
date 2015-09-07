let g:rainbow_active = 1

let g:rainbow_conf = {
  \   'ctermfgs': ['darkred', 'darkcyan', 'darkgreen', 'darkmagenta', 'darkblue', 'brown'],
  \   'separately': {
  \   }
  \ }

noremap <leader>rt :RainbowToggle<cr>

augroup plugin_rainbow
  autocmd!
  autocmd BufNewFile,BufReadPost *.html RainbowToggleOff
augroup END
