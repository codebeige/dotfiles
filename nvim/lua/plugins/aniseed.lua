local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/aniseed.fnl"
local _2amodule_name_2a = "plugins.aniseed"
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
local function append(t, v)
  table.insert(t, v)
  return t
end
_2amodule_locals_2a["append"] = append
local function setup()
  vim.g.fennel_fuzzy_indent_patterns = append(vim.g.fennel_fuzzy_indent_patterns, "^with-")
  return nil
end
_2amodule_2a["setup"] = setup
return _2amodule_2a