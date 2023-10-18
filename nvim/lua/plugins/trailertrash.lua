-- [nfnl] Compiled from fnl/plugins/trailertrash.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local function config()
  return which_key.register({bt = {"<Cmd>TrailerTrim<CR>", "Trim trailing whitespace", mode = {"n", "x"}}, t = {"<Cmd>Trailer<CR>", "Toggle highlighting of trailing whitespace"}}, {mode = {"n"}, prefix = "<Leader>"})
end
return {"csexton/trailertrash.vim", config = config}
