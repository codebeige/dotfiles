local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/core.fnl"
local _2amodule_name_2a = "lib.core"
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
local function conj(t, ...)
  local t_2a = (t or {})
  for _, v in ipairs({...}) do
    table.insert(t_2a, v)
  end
  return t_2a
end
_2amodule_2a["conj"] = conj
local deep_merge
local function _1_(...)
  return vim.tbl_deep_extend("keep", ...)
end
deep_merge = _1_
_2amodule_2a["deep-merge"] = deep_merge
return _2amodule_2a