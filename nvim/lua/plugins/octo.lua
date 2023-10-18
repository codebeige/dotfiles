-- [nfnl] Compiled from fnl/plugins/octo.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local octo = autoload("octo")
local function config()
  return octo.setup()
end
return {config = config}
