function! lspconfig#clojure#format_move_operator(type)
  lua vim.lsp.buf.range_formatting(
        \ {},
        \ vim.api.nvim_buf_get_mark(0, '['),
        \ vim.api.nvim_buf_get_mark(0, ']')
        \ )
  call winrestview(s:winview)
endfunction

function! lspconfig#clojure#format_move()
  let s:winview = winsaveview()
  set operatorfunc=lspconfig#clojure#format_move_operator
  normal g@
endfunction
