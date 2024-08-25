-- [nfnl] Compiled from fnl/lsp/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("lspconfig")
local fennel_ls = _local_2_["fennel_ls"]
local function setup(opts)
  if (1 == vim.fn.executable("fennel-ls")) then
    return fennel_ls.setup(opts)
  else
    return print("LSP: fennel-ls not found")
  end
end
return {setup = setup}
