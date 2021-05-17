lua <<EOF
_G.statusline = require "statusline"

vim.o.statusline = table.concat{
  "%-4.{v:lua.statusline.buffer_status()}",
  -- "%{v:lua.statusline.git_head()}",
  "%<%{v:lua.statusline.filepath()}",
  "%=",
  "%-14.(%l,%c%V%)",
  " %P ",
}
EOF

" augroup update_statusline_vars
"   autocmd!
"   autocmd BufNewFile,BufRead,FileChangedshellPost * call v:lua.statusline.git_update(expand("<abuf>"))
" augroup END
