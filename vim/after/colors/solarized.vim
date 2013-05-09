highlight clear MatchParen
highlight MatchParen term=reverse cterm=reverse ctermfg=2 gui=reverse guifg=#2aa198
highlight Visual term=reverse cterm=reverse ctermfg=6 gui=reverse guifg=#2aa198

if &background == "dark"
  highlight Cursor guibg=turquoise1
  highlight CursorLine ctermbg=9
  highlight CursorLineNr ctermbg=9 ctermfg=5 guifg=DarkSlateGray3
  highlight StatusLineNC ctermfg=9 ctermbg=0 cterm=reverse
  highlight VertSplit ctermfg=9 ctermbg=0 cterm=reverse
  highlight Pmenu ctermbg=7
else
  highlight CursorLineNr cterm=reverse ctermbg=7 ctermfg=5 
  highlight VertSplit ctermfg=9 ctermbg=8 cterm=reverse
  highlight Pmenu ctermfg=0 ctermbg=6
  highlight PmenuSel cterm=reverse ctermbg=8
endif
