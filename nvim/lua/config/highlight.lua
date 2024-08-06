-- [nfnl] Compiled from fnl/config/highlight.fnl by https://github.com/Olical/nfnl, do not edit.
local highlight = require("lib.highlight")
local function update_highlights()
  highlight["make-italic"]("Comment")
  vim.api.nvim_set_hl(0, "NormalFloat", {link = "Normal"})
  return vim.api.nvim_set_hl(0, "FloatBorder", {link = "FloatNormal"})
end
local function init()
  highlight.link("NormalFloat", "Normal")
  local g = vim.api.nvim_create_augroup("config_highlight", {clear = true})
  vim.api.nvim_create_autocmd("ColorScheme", {group = g, pattern = "*", callback = update_highlights})
  return update_highlights()
end
return {init = init}
