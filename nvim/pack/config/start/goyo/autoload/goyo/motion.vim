function goyo#motion#init()
  noremap $ g$
  noremap 0 g0
  noremap <down> gj
  noremap <up> gk
  noremap ^ g^
  noremap j gj
  noremap k gk
endfunction

function goyo#motion#exit()
  unmap $
  unmap 0
  unmap <down>
  unmap <up>
  unmap ^
  unmap j
  unmap k
endfunction
