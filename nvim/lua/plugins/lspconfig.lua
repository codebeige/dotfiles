local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/lspconfig.fnl"
local _2amodule_name_2a = "plugins.lspconfig"
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
local clojure, cmp_lsp, lsp, nvim, vscode, _ = autoload("lsp.clojure"), autoload("cmp_nvim_lsp"), autoload("lsp.shared"), autoload("aniseed.nvim"), autoload("lsp.vscode"), nil
_2amodule_locals_2a["clojure"] = clojure
_2amodule_locals_2a["cmp-lsp"] = cmp_lsp
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["vscode"] = vscode
_2amodule_locals_2a["_"] = _
local function update_colorscheme()
  nvim.ex["highlight!"]("link", "LspReferenceText", "Visual")
  nvim.ex["highlight!"]("link", "LspReferenceRead", "LspReferenceText")
  return nvim.ex["highlight!"]("link", "LspReferenceWrite", "LspReferenceText")
end
_2amodule_2a["update-colorscheme"] = update_colorscheme
local capabilities = cmp_lsp.default_capabilities()
do end (_2amodule_locals_2a)["capabilities"] = capabilities
local function config()
  do
    local nvim_1_auto = require("aniseed.nvim")
    nvim_1_auto.ex.augroup("config_lspconfig")
    nvim_1_auto.ex.autocmd_()
    do
      local nvim_2_auto = require("aniseed.nvim")
      nvim_2_auto.ex.autocmd("ColorScheme", "*", ("lua require('" .. _2amodule_name_2a .. "')['" .. "update-colorscheme" .. "']()"))
    end
    nvim_1_auto.ex.augroup("END")
  end
  update_colorscheme()
  local opts = {capabilities = capabilities, on_attach = lsp["on-attach"]}
  clojure.setup(opts)
  return vscode.setup(opts)
end
_2amodule_2a["config"] = config
return _2amodule_2a