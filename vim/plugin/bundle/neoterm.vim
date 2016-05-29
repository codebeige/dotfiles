if has('nvim')
  nnoremap <silent> <leader>ta :Ttoggle<cr>
  nnoremap <leader>tm :Tmap
  nnoremap <silent> <leader>tn :Tnew<cr>
  nnoremap <silent> <leader>to :Topen<cr>
  nnoremap <silent> <leader>tc :Tclose<cr>
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  nnoremap <silent> <leader>tx :call neoterm#kill()<cr>

  noremap <silent> <leader>te :TREPLSend<cr>
  nnoremap <silent> <leader>tE :TREPLSendFile<cr>

  nnoremap <silent> <leader>tr :call neoterm#test#rerun()<cr>
  nnoremap <silent> <localleader>ta :call neoterm#test#run('all')<cr>
  nnoremap <silent> <localleader>tr :call neoterm#test#run('file')<cr>
  nnoremap <silent> <localleader>tR :call neoterm#test#run('current')<cr>
endif
