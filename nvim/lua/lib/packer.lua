local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/packer.fnl"
local _2amodule_name_2a = "lib.packer"
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
local a, packer = autoload("aniseed.core"), autoload("packer")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["packer"] = packer
local function plugin(location, opts)
  return a.assoc(opts, 1, location)
end
_2amodule_2a["plugin"] = plugin
local function use(location, opts)
  return packer.use(plugin(location, opts))
end
_2amodule_2a["use"] = use
local function startup(f, config)
  local function _1_()
    return f(use, plugin)
  end
  return packer.startup(_1_, config)
end
_2amodule_2a["startup"] = startup
return _2amodule_2a