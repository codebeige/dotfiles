local _2afile_2a = "/Users/tc/.config/nvim/fnl/lsp/shared.fnl"
local _2amodule_name_2a = "lsp.shared"
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
local a, nvim, util, which_key, _ = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("lib.util"), autoload("which-key"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["which-key"] = which_key
_2amodule_locals_2a["_"] = _
local function format_range()
  local view_3_auto = vim.fn.winsaveview()
  do
    vim.lsp.buf.range_formatting({}, nvim.buf_get_mark(0, "["), nvim.buf_get_mark(0, "]"))
  end
  return vim.fn.winrestview(view_3_auto)
end
_2amodule_locals_2a["format-range"] = format_range
local function format_move()
  local nvim_4_auto = require("aniseed.nvim")
  local function _1_()
    _G["_lib_macros_operatorfunc"] = nil
    return nvim_4_auto.set_option("operatorfunc", "v:lua._lib_macros_operatorfunc")
  end
  _G["_lib_macros_operatorfunc"] = _1_
  return nil
end
_2amodule_2a["format-move"] = format_move
local function on_attach(client, bufnr)
  which_key.register({["<C-]>"] = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "Jump to definition"}, K = {"<Cmd>lua vim.lsp.buf.hover()<CR>", "Show documentation"}, ["["] = {d = {"<Cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic"}}, ["]"] = {d = {"<Cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic"}}}, {buffer = bufnr})
  which_key.register({q = {name = "format", q = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", "Format selection"}}}, {buffer = bufnr, mode = "v", prefix = "<LocalLeader>"})
  which_key.register({b = {name = "buffer", ["="] = {"<Cmd>lua vim.lsp.buf.format{async=true}<CR>", "Format buffer"}, d = {"<Cmd>lua vim.diagnostic.setloclist()<CR>", "List diagnostics"}}, f = {name = "find", d = {"<Cmd>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics"}, r = {"<Cmd>lua require('telescope.builtin').lsp_references()<CR>", "References"}, s = {"<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols"}, S = {"<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace symbols"}}, v = {name = "view", d = {"<Cmd>lua vim.diagnostic.open_float()<CR>", "View diagnostics"}, h = {"<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help"}}, q = {name = "format", q = {"<Cmd>lua require('lsp.shared')['format-move']()<CR>g@", "Format lines motion"}}, x = {name = "transform", r = {"<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol..."}, x = {"<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code action..."}}}, {prefix = "<LocalLeader>", buffer = bufnr})
  which_key.register({x = {name = "transform", x = {"<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code action..."}}}, {prefix = "<LocalLeader>", buffer = bufnr, mode = "v"})
  if client.server_capabilities.documentHighlightProvider then
    local nvim_1_auto = require("aniseed.nvim")
    nvim_1_auto.ex.augroup(string.format("lib_lsp_%d", bufnr))
    nvim_1_auto.ex.autocmd_()
    do
      nvim.ex.autocmd("CursorHold", "<buffer>", "lua vim.lsp.buf.document_highlight()")
      nvim.ex.autocmd("CursorHoldI", "<buffer>", "lua vim.lsp.buf.document_highlight()")
      nvim.ex.autocmd("CursorMoved", "<buffer>", "lua vim.lsp.buf.clear_references()")
    end
    nvim_1_auto.ex.augroup("END")
  else
  end
  do
    local g = vim.api.nvim_create_augroup("lsp-on-attach", {clear = true})
    local function _3_()
      return vim.lsp.buf.format({async = false})
    end
    vim.api.nvim_create_autocmd("BufWritePre", {buffer = 0, callback = _3_, group = g})
  end
  return print(string.format("LSP ready. [%s]", client.name))
end
_2amodule_2a["on-attach"] = on_attach
return _2amodule_2a