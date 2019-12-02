if exists('g:loaded_lexima_rules_lua')
  finish
endif
let g:loaded_lexima_rules_lua = 1

call lexima#add_rule({
  \ 'filetype': 'lua',
  \ 'at': '\C\<function\>.*\%#$',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>end',
  \ 'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1end'
  \ })

call lexima#add_rule({
  \ 'filetype': 'lua',
  \ 'at': '\C\v<%(do|then)%#$',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>end',
  \ 'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1end'
  \ })
