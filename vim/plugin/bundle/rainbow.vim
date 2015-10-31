let g:rainbow_active = 1

let g:rainbow_conf = {
  \   'ctermfgs': ['DarkRed', 'DarkBlue', 'DarkMagenta', 'DarkGreen', 'Brown', 'Magenta'],
  \   'separately': {
  \   }
  \ }

noremap <leader>rt :RainbowToggle<cr>

augroup plugin_rainbow
  autocmd!
  autocmd BufNewFile,BufReadPost *.html RainbowToggleOff
augroup END
