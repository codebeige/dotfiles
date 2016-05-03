if has('nvim')
  augroup Neovim
    autocmd!
    autocmd * VimResized :mode<cr>
  augroup END
endif
