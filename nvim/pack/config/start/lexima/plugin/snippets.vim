if exists('g:loaded_lexima_rules_snippets')
  finish
endif
let g:loaded_lexima_rules_snippets = 1

call lexima#add_rule({
  \ 'filetype': ['snippets'],
  \ 'at': '\C^snippet\s.\+\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>endsnippet',
  \ 'except': '\C^snippet\s.\+\%#\n\%(\s*\n\)*endsnippet\>',
  \ })
