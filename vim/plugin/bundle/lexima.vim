if exists('g:loaded_lexima_custom_rules')
  finish
endif
let g:loaded_lexima_custom_rules = 1

call lexima#add_rule({
  \ 'at': '{\%#',
  \ 'char': '%',
  \ 'input': '% ',
  \ 'input_after': ' %',
  \ 'filetype': ['liquid'],
  \ })
