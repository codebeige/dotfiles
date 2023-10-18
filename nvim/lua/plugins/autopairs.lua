-- [nfnl] Compiled from fnl/plugins/autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local autopairs = autoload("nvim-autopairs")
local disabled_filetypes = {"", "TelescopePrompt", "clojure", "fennel", "scheme", "lisp", "timl"}
local function config()
  return autopairs.setup({check_ts = true, disable_filetype = disabled_filetypes})
end
return {"windwp/nvim-autopairs", config = config}
