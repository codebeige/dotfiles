local _2afile_2a = "/Users/tc/.config/nvim/fnl/lsp/vscode.fnl"
local _2amodule_name_2a = "lsp.vscode"
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
local lspconfig = autoload("lspconfig")
do end (_2amodule_locals_2a)["lspconfig"] = lspconfig
local function setup(opts)
  lspconfig.cssls.setup(opts)
  lspconfig.eslint.setup(opts)
  lspconfig.html.setup(opts)
  return lspconfig.jsonls.setup(opts)
end
_2amodule_2a["setup"] = setup
return _2amodule_2a