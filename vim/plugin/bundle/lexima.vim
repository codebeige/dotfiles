if exists('g:loaded_lexima_custom_rules')
  finish
endif
let g:loaded_lexima_custom_rules = 1

" liquid

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '{\%#',
  \ 'char': '%',
  \ 'input_after': '%',
  \ })

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '{%\%#%}',
  \ 'char': '<space>',
  \ 'input_after': '<space>',
  \ })

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '\C^\s*{% block\>\%(.*\)%}\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>{% endblock %}',
  \ 'except': '\C^\(\s*\){% block\>\%(.*\)%}\%#\n\%(\s*\n\)*\1{%\s\+endblock\>',
  \ })

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '\C^\s*{% if\>\%(.*\)%}\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>{% endif %}',
  \ 'except': '\C^\(\s*\){% if\>\%(.*\)%}\%#\n\%(\s*\n\)*\1{%\s\+endif\>',
  \ })

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '\C^\s*{% case\>\%(.*\)%}\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>{% endcase %}',
  \ 'except': '\C^\(\s*\){% case\>\%(.*\)%}\%#\n\%(\s*\n\)*\1{%\s\+endcase\>',
  \ })

call lexima#add_rule({
  \ 'filetype': ['liquid'],
  \ 'at': '\C^\s*{% for\>\%(.*\)%}\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>{% endfor %}',
  \ 'except': '\C^\(\s*\){% for\>\%(.*\)%}\%#\n\%(\s*\n\)*\1{%\s\+endfor\>',
  \ })

" snippets
call lexima#add_rule({
  \ 'filetype': ['snippets'],
  \ 'at': '\C^snippet\s.\+\%#',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>endsnippet',
  \ 'except': '\C^snippet\s.\+\%#\n\%(\s*\n\)*endsnippet\>',
  \ })

" lua
call lexima#add_rule({
  \ 'filetype': 'lua',
  \ 'at': '\C\<function\>.*\%#$',
  \ 'char': '<cr>',
  \ 'input_after': '<cr>end',
  \ 'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1end'
  \ })
