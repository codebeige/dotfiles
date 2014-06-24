command! Konacha :call Konacha()
function! Konacha()
  let path = ''
  let base = expand('%:r:r')
  if base =~# '\v^(app|spec)'
    let path = substitute(base, '\v^[^/]+/(.{-})(_spec)?$', '\1', '')
  endif
  let url = 'http://localhost:3500/'.path.'_spec'
  execute('silent !chrome '.url)
  redraw!
  echo 'Konacha: '.url
endfunction
