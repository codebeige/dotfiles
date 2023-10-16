local _2afile_2a = "/Users/tc/.config/nvim/fnl/config/diagnostic.fnl"
local _2amodule_name_2a = "config.diagnostic"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local highlight, nvim, _ = autoload("lib.highlight"), autoload("aniseed.nvim"), nil
_2amodule_locals_2a["highlight"] = highlight
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["_"] = _
local signs = {Error = "!", Warn = "*", Info = "~", Hint = "?"}
_2amodule_locals_2a["signs"] = signs
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
_2amodule_2a["update-highlights"] = update_highlights
do
  local nvim_1_auto = require("aniseed.nvim")
  nvim_1_auto.ex.augroup("config_diagnostic")
  nvim_1_auto.ex.autocmd_()
  do
    local nvim_2_auto = require("aniseed.nvim")
    nvim_2_auto.ex.autocmd("ColorScheme", "*", ("lua require('" .. _2amodule_name_2a .. "')['" .. "update-highlights" .. "']()"))
  end
  nvim_1_auto.ex.augroup("END")
end
update_highlights()
vim.diagnostic.config({virtual_text = {prefix = "\226\128\162"}})
return _2amodule_2a