local _2afile_2a = "/Users/tc/.config/nvim/fnl/config/highlight.fnl"
local _2amodule_name_2a = "config.highlight"
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
local highlight, _ = autoload("lib.highlight"), nil
_2amodule_locals_2a["highlight"] = highlight
_2amodule_locals_2a["_"] = _
local function update_highlights()
  return highlight["make-italic"]("Comment")
end
_2amodule_2a["update-highlights"] = update_highlights
do
  local nvim_1_auto = require("aniseed.nvim")
  nvim_1_auto.ex.augroup("config_highlight")
  nvim_1_auto.ex.autocmd_()
  do
    local nvim_2_auto = require("aniseed.nvim")
    nvim_2_auto.ex.autocmd("ColorScheme", "*", ("lua require('" .. _2amodule_name_2a .. "')['" .. "update-highlights" .. "']()"))
  end
  nvim_1_auto.ex.augroup("END")
end
update_highlights()
return _2amodule_2a