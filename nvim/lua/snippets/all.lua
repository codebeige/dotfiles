local _2afile_2a = "/Users/tc/.config/nvim/fnl/snippets/all.fnl"
local _2amodule_name_2a = "snippets.all"
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
local s = autoload("lib.snippet")
do end (_2amodule_locals_2a)["s"] = s
local defsnippet
local function _1_(...)
  return s.defsnippet("all", ...)
end
defsnippet = _1_
_2amodule_locals_2a["defsnippet"] = defsnippet
defsnippet("lipsum", s.t("Lorem ipsum dolor sic amet"))
--[[ (luasnip.cleanup) ]]
return _2amodule_2a