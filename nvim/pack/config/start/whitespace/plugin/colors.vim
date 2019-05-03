function! s:HighlightWhitespace() abort
  highlight link Whitespace Special
endfunction

augroup whitespace_colors
  autocmd!
  autocmd ColorScheme * call s:HighlightWhitespace()
augroup END
call s:HighlightWhitespace()
