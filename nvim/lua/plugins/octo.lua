local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/octo.fnl"
local _2amodule_name_2a = "plugins.octo"
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
local octo = autoload("octo")
do end (_2amodule_locals_2a)["octo"] = octo
local function config()
  return octo.setup()
end
_2amodule_2a["config"] = config
return _2amodule_2a