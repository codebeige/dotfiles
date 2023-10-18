-- [nfnl] Compiled from fnl/config/diagnostic.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local highlight = autoload("lib.highlight")
local signs = {Error = "!", Warn = "*", Info = "~", Hint = "?"}
for s, t in pairs(signs) do
  local name = ("DiagnosticSign" .. s)
  vim.fn.sign_define(name, {text = (" " .. t), texthl = name, numhl = name})
end
local function update_highlights()
  highlight["make-italic"]("DiagnosticError")
  highlight["make-italic"]("DiagnosticWarn")
  highlight["make-italic"]("DiagnosticInfo")
  return highlight["make-italic"]("DiagnosticHint")
end
do
  local g = vim.api.nvim_create_augroup("config_diagnostic", {clear = true})
  vim.api.nvim_create_autocmd("ColorScheme", {group = g, pattern = "*", callback = update_highlights})
end
update_highlights()
return vim.diagnostic.config({virtual_text = {prefix = "\226\128\162"}})
