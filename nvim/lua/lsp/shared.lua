-- [nfnl] Compiled from fnl/lsp/shared.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
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
local function on_attach(client, buffer)
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
  local function _8_()
    return vim.lsp.buf.format({async = true})
  end
  local function _9_()
    return vim.diagnostic.setloclist()
  end
  local function _10_()
    return telescope.diagnostics()
  end
  local function _11_()
    return telescope.lsp_references()
  end
  local function _12_()
    return telescope.lsp_document_symbols()
  end
  local function _13_()
    return telescope.lsp_workspace_symbols()
  end
  local function _14_()
    return vim.lsp.buf.range_formatting()
  end
  local function _15_()
    return vim.lsp.buf.rename()
  end
  local function _16_()
    return vim.lsp.buf.code_action()
  end
  local function _17_()
    return vim.diagnostic.open_float()
  end
  local function _18_()
    return vim.lsp.buf.signature_help()
  end
  which_key.add({{"<C-]>", _4_, buffer = buffer, desc = "Jump to definition"}, {"K", _5_, buffer = buffer, desc = "Show documentation"}, {"[d", _6_, buffer = buffer, desc = "Previous diagnostic"}, {"]d", _7_, buffer = buffer, desc = "Next diagnostic"}, {"<LocalLeader>b", group = "buffer"}, {"<LocalLeader>b=", _8_, buffer = buffer, desc = "Format buffer"}, {"<LocalLeader>bd", _9_, buffer = buffer, desc = "List diagnostics"}, {"<LocalLeader>f", group = "find"}, {"<LocalLeader>fd", _10_, buffer = buffer, desc = "Diagnostics"}, {"<LocalLeader>fr", _11_, buffer = buffer, desc = "References"}, {"<LocalLeader>fs", _12_, buffer = buffer, desc = "Document symbols"}, {"<LocalLeader>fS", _13_, buffer = buffer, desc = "Workspace symbols"}, {"<LocalLeader>q", group = "format"}, {"<LocalLeader>qq", "<Cmd>lua require('lsp.shared')['format-move']()<CR>g@", buffer = buffer, desc = "Format lines to {motion}"}, {"<LocalLeader>qq", _14_, buffer = buffer, desc = "Format selection", mode = "v"}, {"<LocalLeader>xr", _15_, buffer = buffer, desc = "Rename symbol..."}, {"<LocalLeader>xx", _16_, buffer = buffer, desc = "Code action...", mode = {"n", "x"}}, {"<LocalLeader>v", group = "view"}, {"<LocalLeader>vd", _17_, buffer = buffer, desc = "View diagnostics"}, {"<LocalLeader>vh", _18_, buffer = buffer, desc = "Signature help"}})
  if client.server_capabilities.documentHighlightProvider then
    local g = vim.api.nvim_create_augroup(string.format("lib_lsp_%d", buffer), {clear = true})
    local function _19_()
      return vim.lsp.buf.document_highlight()
    end
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = 0, callback = _19_, group = g})
    local function _20_()
      return vim.lsp.buf.clear_references()
    end
    vim.api.nvim_create_autocmd("CursorMoved", {buffer = 0, callback = _20_, group = g})
  else
  end
  do
    local g = vim.api.nvim_create_augroup("lsp-on-attach", {clear = true})
    local function _22_()
      return vim.lsp.buf.format({async = false})
    end
    vim.api.nvim_create_autocmd("BufWritePre", {buffer = 0, callback = _22_, group = g})
  end
  return print(string.format("LSP ready. [%s]", client.name))
end
return {["format-move"] = format_move, ["on-attach"] = on_attach}
