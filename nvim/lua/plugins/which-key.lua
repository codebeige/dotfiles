local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/which-key.fnl"
local _2amodule_name_2a = "plugins.which-key"
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
local util, which_key = autoload("lib.util"), autoload("which-key")
do end (_2amodule_locals_2a)["util"] = util
_2amodule_locals_2a["which-key"] = which_key
local function config()
  util["set-opts"]("o", {timeoutlen = 500})
  which_key.setup()
  return which_key.register({["["] = "previous|above|up|enable", ["]"] = "next|below|down|disable"})
end
_2amodule_2a["config"] = config
return _2amodule_2a