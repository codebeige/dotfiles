-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local clojure = autoload("lsp.clojure")
local cmp_lsp = autoload("cmp_nvim_lsp")
local fennel = autoload("lsp.fennel")
local tsserver = autoload("lsp.tsserver")
local _local_2_ = autoload("lsp.shared")
local on_attach = _local_2_["on-attach"]
local ui = autoload("config.ui")
local capabilities = cmp_lsp.default_capabilities()
local handlers = {["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = ui.border}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {border = ui.border})}
local function update_colorscheme()
  vim.api.nvim_set_hl(0, "LspReferenceText", {link = "Visual"})
  vim.api.nvim_set_hl(0, "LspReferenceRead", {link = "LspReferenceText"})
  return vim.api.nvim_set_hl(0, "LspReferenceWrite", {link = "LspReferenceText"})
end
local function config()
  do
    local g = vim.api.nvim_create_augroup("config_lspconfig", {clear = true})
    vim.api.nvim_create_autocmd("ColorScheme", {callback = update_colorscheme, group = g, pattern = "*"})
  end
  update_colorscheme()
  local opts = {capabilities = capabilities, handlers = handlers, on_attach = on_attach}
  fennel.setup(opts)
  clojure.setup(opts)
  return tsserver.setup(opts)
end
return {"neovim/nvim-lspconfig", config = config, dependencies = {"hrsh7th/cmp-nvim-lsp"}}
