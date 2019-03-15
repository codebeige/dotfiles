if exists('g:loaded_fzf_config')
  finish
endif
let g:loaded_fzf_config = 1

let g:fzf_history_dir = stdpath('data') . '/fzf-history'

function! s:HideStatusLine()
  let l:restore_cmd =
        \ '  let &laststatus=' . &laststatus .
        \ '| let &showmode='   . &showmode .
        \ '| let &ruler='      . &ruler
  set laststatus=0 noshowmode noruler
  execute 'autocmd BufLeave <buffer>' . l:restore_cmd
endfunction

augroup fzf_config
  autocmd!
  autocmd FileType fzf call s:HideStatusLine()
augroup END
