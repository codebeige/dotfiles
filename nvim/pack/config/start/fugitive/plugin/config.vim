nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>

nnoremap <Leader>gg :Glog --<CR>
nnoremap <LocalLeader>gg :0Gllog<CR>
nnoremap <Leader>gb :Gblame<CR>

nnoremap <Leader>gf :Gfetch<CR>
nnoremap <Leader>gl :Gpull<CR>
nnoremap <Leader>gm :Gmerge<CR>
nnoremap <Leader>gp :Gpush<CR>

augroup fugitive_config
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
