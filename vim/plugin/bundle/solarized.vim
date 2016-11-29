let g:solarized_termtrans=1

colorscheme solarized

function! s:updateBackground()
  if $ITERM_PROFILE =~ '\clight'
    set background=light
  else
    set background=dark
  endif
endfunction

call s:updateBackground()

augroup solarized_plugin
  autocmd!
  autocmd FocusGained * call s:updateBackground()
augroup END
