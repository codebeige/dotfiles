function! s:CocHighlight() abort
  highlight link CocHighlightText Visual
endfunction

augroup coc_colors
  autocmd!
  autocmd ColorScheme * call s:CocHighlight()
augroup END
call s:CocHighlight()
