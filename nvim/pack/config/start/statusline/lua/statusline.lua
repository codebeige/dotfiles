local M = {}

function M.buffer_status()
  local flag = " "
  if vim.bo.buftype == "help" then
    flag = "?"
  elseif vim.bo.readonly or not vim.bo.modifiable then
    flag = "-"
  elseif vim.bo.modified then
    flag = "+"
  end
  return string.format("[%s]", flag)
end

function M.git_head()
  local head = vim.fn["fugitive#head"]()
  if head == nil or head == "" then
    return ""
  end
  return string.format("[%s]", head)
end

local function bufname(buffer)
  local buffer = buffer or "%"
  local bufname = vim.fn.bufname(buffer)
  local filetype = vim.api.nvim_buf_get_option(buffer, "filetype")
  if filetype == "netrw" and bufname == "" then
    return vim.api.nvim_buf_get_var(buffer, "netrw_curdir")
  end
  return bufname
end

function M.filepath()
  local filepath = vim.fn.fnamemodify(bufname(), ":.")
  local filetype = vim.bo.filetype
  if filetype == "help" then
    return vim.fn.fnamemodify(filepath, ":t")
  end
  return filepath
end

function M.lsp_info()
  local info = vim.b.lsp_info
  if info == nil or info == "" then
    return ""
  end
  return "*"
end

return M
