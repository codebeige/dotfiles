lua <<EOF
_G.statusline = require "statusline"

vim.o.statusline = table.concat{
  "%{v:lua.statusline.buffer_status()}",
  "%{v:lua.statusline.git_head()}",
  "%<%f",
  "%=",
  "%-14.(%l,%c%V%)",
  " %P ",
}
EOF

augroup update_statusline_vars
  autocmd!
  autocmd BufNewFile,BufRead,FileChangedshellPost * call v:lua.statusline.git_update(expand("<abuf>"))
augroup END
