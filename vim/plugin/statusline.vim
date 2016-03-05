function! FugitiveStatus()
  return substitute(fugitive#statusline(),
                  \ 'Git\(:[^(]\+\)\?(\(.*\))',
                  \ '\=submatch(2).submatch(1)',
                  \ '')
endfunction

set statusline=[%n]\ %(%h%q%w\ %)%.40f\ %y
set statusline+=%=%m
set statusline+=%{FugitiveStatus()}
set statusline+=%20.(%l:%c\ (%L/%p%%)%)
