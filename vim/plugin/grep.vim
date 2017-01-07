if executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column
  set grepformat=%f:%l:%c:%m
endif
