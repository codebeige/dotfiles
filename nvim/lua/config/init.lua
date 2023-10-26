-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local scratch = autoload("codebeige.scratch")
require("config.highlight")
require("config.diagnostic")
require("config.terminal")
require("config.clojure")
require("config.fennel")
local loaded_3f = false
local function init()
  if not loaded_3f then
    scratch.init()
  else
  end
  return true
end
loaded_3f = init()
return {init = init}
