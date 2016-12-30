augroup slamhound_clj
  autocmd!
  autocmd BufNewFile,BufRead *.clj{c,} nnoremap <LocalLeader>ns :Slamhound<CR>
augroup END
