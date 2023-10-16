local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/surround.fnl"
local _2amodule_name_2a = "plugins.surround"
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
local util = autoload("lib.util")
do end (_2amodule_locals_2a)["util"] = util
local function setup()
  return util["set-opts"]("g:surround_", {no_insert_mappings = true})
end
_2amodule_2a["setup"] = setup
return _2amodule_2a