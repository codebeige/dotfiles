nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gl :Gpull<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gf :Gfetch<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :Gmerge<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gg :Glog<cr>

augroup FugitivePlugin
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
