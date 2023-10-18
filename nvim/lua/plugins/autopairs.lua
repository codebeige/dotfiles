-- [nfnl] Compiled from fnl/plugins/autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl = autoload("nfnl.core")
local autopairs = autoload("nvim-autopairs")
local sexp = autoload("plugins.sexp")
local disabled_filetypes = nfnl.concat({"", "TelescopePrompt"}, sexp.filetypes)
local function config()
  return autopairs.setup({check_ts = true, disable_filetype = disabled_filetypes})
end
return {config = config}
