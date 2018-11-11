let s:modes = {
      \ 'n':      'NORMAL',
      \ 'no':     'NORMAL',
      \ 'v':      'VISUAL',
      \ 'V':      'VISUAL LINE',
      \ "\<C-v>": 'VISUAL BLOCK',
      \ 's':      'SELECT',
      \ 'S':      'SELECT LINE',
      \ "\<C-s>": 'SELECT BLOCK',
      \ 'i':      'INSERT',
      \ 'ic':     'INSERT',
      \ 'ix':     'INSERT',
      \ 'R':      'REPLACE',
      \ 'Rc':     'REPLACE',
      \ 'Rv':     'VREPLACE',
      \ 'Rx':     'REPLACE',
      \ 'c':      'COMMAND',
      \ 'cv':     'EX',
      \ 'ce':     'EX',
      \ 'r':      'PROMPT',
      \ 'rm':     'PROMPT',
      \ 'r?':     'PROMPT',
      \ '!':      'SHELL',
      \ 't':      'TERMINAL',
      \ }

function! CapsLockStatus()
  if len(CapsLockStatusline())
    return ' *'
  else
    return ''
  endif
endfunction

function! ModeStatus()
  return '| ' . get(s:modes, mode(), '') . CapsLockStatus() . ' |'
endfunction

function! GitStatus()
  let l:head = fugitive#head(10)
  if len(head)
    let l:status = '[' . head . ']'
  else
    let l:status = ''
  endif
  return l:status
endfunction

set statusline=%{ModeStatus()}\ %<
set statusline+=%(%h%q%w\ %)%.40f\ %y
set statusline+=%=%m
set statusline+=%{GitStatus()}
set statusline+=\ %.(%l:%c\ (%L/%p%%)%)
