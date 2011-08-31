highlight clear MatchParen
highlight MatchParen term=reverse cterm=reverse ctermfg=6 gui=reverse guifg=#2aa198

highlight clear NonText
highlight clear SpecialKey

if &background == "dark"
  highlight NonText    ctermfg=6 guifg=#586e75
  highlight SpecialKey ctermfg=6 guifg=#586e75
else
  highlight NonText    ctermfg=2 guifg=Grey
  highlight SpecialKey ctermfg=2 guifg=Grey
endif
