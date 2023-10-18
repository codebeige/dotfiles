-- [nfnl] Compiled from fnl/config/highlight.fnl by https://github.com/Olical/nfnl, do not edit.
local highlight = require("lib.highlight")
local function update_highlights()
  return highlight["make-italic"]("Comment")
end
do
  local g = vim.api.nvim_create_augroup("config_highlight", {clear = true})
  vim.api.nvim_create_autocmd("ColorScheme", {group = g, pattern = "*", callback = update_highlights})
end
return update_highlights()
