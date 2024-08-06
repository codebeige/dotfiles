-- [nfnl] Compiled from fnl/lsp/tsserver.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("lspconfig")
local tsserver = _local_2_["tsserver"]
local function setup(_)
  if (1 == vim.fn.executable("typescript-language-server")) then
    return tsserver.setup({})
  else
    return nil
  end
end
return {setup = setup}
