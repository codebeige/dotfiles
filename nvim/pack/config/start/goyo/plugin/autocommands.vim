function! s:goyo_enter()
  call goyo#options#init()
  call goyo#motion#init()
  call goyo#colors#init()
endfunction

function! s:goyo_leave()
  call goyo#options#exit()
  call goyo#motion#exit()
  call goyo#colors#exit()
endfunction

augroup goyo_setup_and_teardown
  autocmd!
  autocmd User GoyoEnter call <SID>goyo_enter()
  autocmd User GoyoLeave call <SID>goyo_leave()
augroup END
