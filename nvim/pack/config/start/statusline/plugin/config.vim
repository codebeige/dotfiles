lua <<EOF
_G.statusline = require "statusline"

vim.o.statusline = table.concat{
  "%-4.{v:lua.statusline.buffer_status()}",
  "%<",
  "%{v:lua.statusline.filepath()}",
  "%2.{v:lua.statusline.lsp_info()}",
  "%=",
  "%{v:lua.statusline.git_head()}",
  "%10.(%l,%c%V%)",
  "%4.P"
}
EOF
