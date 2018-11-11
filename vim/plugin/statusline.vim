function! GitStatus()
  let head = fugitive#head(10)
  if len(head)
    let status = '[' . head . ']'
  else
    let status = ''
  endif
  return status
endfunction

set statusline=[%n]\ %(%h%q%w\ %)%.40f\ %y
set statusline+=%=%m
set statusline+=%{GitStatus()}
set statusline+=%20.(%l:%c\ (%L/%p%%)%)
