-- [nfnl] Compiled from fnl/lib/packer.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local packer = autoload("packer")
local nfnl = autoload("nfnl.core")
local function plugin(location, opts)
  return nfnl.assoc(opts, 1, location)
end
local function use(location, opts)
  return packer.use(plugin(location, opts))
end
local function startup(f, config)
  local function _2_()
    return f(use, plugin)
  end
  return packer.startup(_2_, config)
end
return {plugin = plugin, use = use, startup = startup}
