if $SOLARIZED_THEME == 'light'
  set background=light
else
  set background=dark
endif

colorscheme solarized

highlight Cursor guibg=#2aa198
highlight CursorLineNr ctermfg=6 guifg=#2aa198
highlight Visual term=reverse cterm=reverse ctermfg=6 gui=reverse guifg=#2aa198

highlight clear MatchParen
highlight MatchParen term=reverse cterm=reverse gui=reverse

highlight ShowTrailingWhitespace ctermbg=1
