let g:rainbow_active = 1

let g:rainbow_conf = {
  \   'ctermfgs': ['DarkRed', 'DarkBlue', 'DarkMagenta', 'DarkGreen', 'Brown', 'Magenta'],
  \   'separately': {
  \     'html': 0,
  \     'css': 0,
  \     'liquid': 0,
  \   }
  \ }

noremap <localleader>cor :RainbowToggle<cr>
noremap <localleader>[or :RainbowToggleOn<cr>
noremap <localleader>öor :RainbowToggleOn<cr>
noremap <localleader>]or :RainbowToggleOff<cr>
noremap <localleader>äor :RainbowToggleOff<cr>
