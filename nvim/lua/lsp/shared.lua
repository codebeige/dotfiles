-- [nfnl] Compiled from fnl/lsp/shared.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local util = autoload("lib.util")
local which_key = autoload("which-key")
local telescope = autoload("telescope.builtin")
local function format_range()
  local view = vim.fn.winsaveview()
  local function _2_()
    return vim.lsp.buf.range_formatting({}, vim.api.nvim_buf_get_mark(0, "["), vim.api.nvim_buf_get_mark(0, "]"))
  end
  pcall(_2_)
  return vim.fn.restview(view)
end
local function format_move()
  local function _3_()
    pcall(format_range)
    vim.g.__operatorfunc = nil
    return nil
  end
  vim.g.__operatorfunc = _3_
  vim.o.operatorfunc = "v:lua.__operatorfunc"
  return nil
end
local function on_attach(client, bufnr)
  local function _4_()
    return vim.lsp.buf.definition()
  end
  local function _5_()
    return vim.lsp.buf.hover()
  end
  local function _6_()
    return vim.diagnostic.goto_prev()
  end
  local function _7_()
    return vim.diagnostic.goto_next()
  end
  which_key.register({["<C-]>"] = {_4_, "Jump to definition"}, K = {_5_, "Show documentation"}, ["["] = {d = {_6_, "Previous diagnostic"}}, ["]"] = {d = {_7_, "Next diagnostic"}}}, {buffer = bufnr})
  which_key.register({q = {name = "format", q = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", "Format selection"}}}, {buffer = bufnr, mode = "v", prefix = "<LocalLeader>"})
  local function _8_()
    return vim.diagnostic.setloclist()
  end
  local function _9_()
    return telescope.diagnostics()
  end
  local function _10_()
    return telescope.lsp_references()
  end
  local function _11_()
    return telescope.lsp_document_symbols()
  end
  local function _12_()
    return telescope.lsp_workspace_symbols()
  end
  local function _13_()
    return vim.diagnostic.open_float()
  end
  local function _14_()
    return vim.lsp.buf.signature_help()
  end
  local function _15_()
    return vim.lsp.buf.rename()
  end
  local function _16_()
    return vim.lsp.buf.code_action()
  end
  which_key.register({b = {name = "buffer", ["="] = {"<Cmd>lua vim.lsp.buf.format{async=true}<CR>", "Format buffer"}, d = {_8_, "List diagnostics"}}, f = {name = "find", d = {_9_, "Diagnostics"}, r = {_10_, "References"}, s = {_11_, "Document symbols"}, S = {_12_, "Workspace symbols"}}, v = {name = "view", d = {_13_, "View diagnostics"}, h = {_14_, "Signature help"}}, q = {name = "format", q = {"<Cmd>lua require('lsp.shared')['format-move']()<CR>g@", "Format lines motion"}}, x = {name = "transform", r = {_15_, "Rename symbol..."}, x = {_16_, "Code action..."}}}, {prefix = "<LocalLeader>", buffer = bufnr})
  local function _17_()
    return vim.lsp.buf.code_action()
  end
  which_key.register({x = {name = "transform", x = {_17_, "Code action..."}}}, {prefix = "<LocalLeader>", buffer = bufnr, mode = "v"})
  if client.server_capabilities.documentHighlightProvider then
    local g = vim.api.nvim_create_augroup(string.format("lib_lsp_%d", bufnr))
    local function _18_()
      return vim.lsp.buf.document_highlight()
    end
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = true, callback = _18_, group = g})
    local function _19_()
      return vim.lsp.buf.clear_references()
    end
    vim.api.nvim_create_autocmd("CursorMoved", {buffer = true, callback = _19_, group = g})
  else
  end
  do
    local g = vim.api.nvim_create_augroup("lsp-on-attach", {clear = true})
    local function _21_()
      return vim.lsp.buf.format({async = false})
    end
    vim.api.nvim_create_autocmd("BufWritePre", {buffer = 0, callback = _21_, group = g})
  end
  return print(string.format("LSP ready. [%s]", client.name))
end
return {["format-move"] = format_move, ["on-attach"] = on_attach}
