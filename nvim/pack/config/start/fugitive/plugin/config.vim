nnoremap <leader>gs :Git<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gh :Git log -10<cr>

nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gg :Git log -10 -- %<cr>
nnoremap <leader>gb :Git blame<cr>

nnoremap <leader>gf :Git fetch --all --prune --jobs=10<cr>
nnoremap <leader>gl :Git pull --force<cr>
nnoremap <leader>gp :Git push --force<cr>
nnoremap <leader>gm :Git mergetool<cr>

function! s:custom_fugitive_mappings()
  nmap <buffer> jj )
  nmap <buffer> kk (
endfunction

augroup fugitive_config
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd Filetype fugitive call s:custom_fugitive_mappings()
augroup END
