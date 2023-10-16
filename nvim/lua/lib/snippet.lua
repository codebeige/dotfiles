local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/snippet.fnl"
local _2amodule_name_2a = "lib.snippet"
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
local a, lib, luasnip = autoload("aniseed.core"), autoload("lib.core"), autoload("luasnip")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["lib"] = lib
_2amodule_locals_2a["luasnip"] = luasnip
local function defsnippet(scope, ...)
  local s = luasnip.snippet(...)
  local function _1_(_241)
    return lib.conj(_241, s)
  end
  return a["update-in"](luasnip, {"snippets", scope}, _1_)
end
_2amodule_2a["defsnippet"] = defsnippet
local t = luasnip.text_node
_2amodule_2a["t"] = t
return _2amodule_2a