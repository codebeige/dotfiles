highlight Cursor guibg=#2aa198
highlight CursorLineNr ctermfg=6 guifg=#2aa198
highlight Visual term=reverse cterm=reverse ctermfg=6 gui=reverse guifg=#2aa198

highlight clear MatchParen
highlight MatchParen term=reverse cterm=reverse gui=reverse

highlight ShowTrailingWhitespace ctermbg=1

if &background == "dark"
  highlight CursorLineNr ctermbg=0
else
  highlight CursorLineNr ctermbg=7
endif
