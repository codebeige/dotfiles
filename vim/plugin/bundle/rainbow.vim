let g:rainbow_active = 1

let g:rainbow_conf = {
  \   'ctermfgs': ['DarkRed', 'DarkBlue', 'DarkMagenta', 'DarkGreen', 'Brown', 'Magenta'],
  \   'separately': {
  \   }
  \ }

noremap <localleader>cor :RainbowToggle<cr>
noremap <localleader>[or :RainbowToggleOn<cr>
noremap <localleader>öor :RainbowToggleOn<cr>
noremap <localleader>]or :RainbowToggleOff<cr>
noremap <localleader>äor :RainbowToggleOff<cr>

augroup plugin_rainbow
  autocmd!
  autocmd BufNewFile,BufReadPost *.html RainbowToggleOff
augroup END
