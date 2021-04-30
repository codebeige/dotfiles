nnoremap <leader>gs :Git<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gh :Git log -10<cr>

nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gg :Git log -10 -- %<cr>
nnoremap <leader>gb :Git blame<cr>

nnoremap <leader>gf :Git fetch --all --prune --jobs=10<cr>
nnoremap <leader>gl :Git pull<cr>
nnoremap <leader>gL :Git pull --force<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gP :Git push --force<cr>
nnoremap <leader>gm :Git mergetool<cr>

augroup fugitive_config
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
