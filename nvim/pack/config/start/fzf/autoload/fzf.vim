let s:rg_default_opts =
      \ '--column --line-number --no-heading --color=always --smart-case'

function! fzf#Rg(bang, ...) abort
  let l:query = fzf#shellescape(get(a:000, -1, ''))
  let l:opts = join(a:000[:-2], ' ')
  let l:cmd = join(['rg', s:rg_default_opts, l:opts, l:query], ' ')
  call fzf#vim#grep(l:cmd, 1, a:bang)
endfunction
