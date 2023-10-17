-- [nfnl] Compiled from fnl/lsp/vscode.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lspconfig = autoload("lspconfig")
local function setup(opts)
  lspconfig.cssls.setup(opts)
  lspconfig.eslint.setup(opts)
  lspconfig.html.setup(opts)
  return lspconfig.jsonls.setup(opts)
end
return {setup = setup}
