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

function buffer_dir(buffer)
  local bufname = vim.fn.fnamemodify(bufname(buffer), ":p")
  local filetype = vim.api.nvim_buf_get_option(buffer, "filetype")
  if filetype == "netrw" then
    return vim.fn.fnamemodify(vim.fn.bufname, ":p")
  end
  return vim.fn.fnamemodify(vim.fn.bufname, ":p:h")
end

local git_cmd = [[
  git symbolic-ref --short --quiet HEAD || git rev-parse --short HEAD
]]

function M.git_update(buffer)
  vim.api.nvim_buf_set_var("%", "git_head", "foo")
  -- local succ, dir = pcall(buffer_dir, buffer)
  -- if succ then
  --   vim.fn.jobstart(git_cmd, {
  --     cwd = dir,
  --     on_stdout = function(_, data, name)
  --       local head = data[1]
  --       if head ~= "" then
  --         vim.api.nvim_buf_set_var(buffer, "git_head", head)
  --       end
  --     end,
  --     on_stderr = function(_, data, _)
  --       if data[1] ~= "" then
  --         pcall(vim.api.nvim_buf_del_var, buffer, "git_head")
  --       end
  --     end,
  --   })
  -- end
end

return M
