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
  local head = vim.b.git_head
  if head == nil or head == "" then
    return ""
  end
  return string.format("[%s]", head)
end

function cwd()
  if vim.bo.filetype == 'netrw' then
    return vim.fn.expand("%:p")
  end
  return vim.fn.expand("%:p:h")
end

local git_cmd = [[
  git symbolic-ref --short --quiet HEAD || git rev-parse --short HEAD
]]

function M.git_update(buffer)
  local succ, dir = pcall(cwd)
  if not succ then return end
  vim.fn.jobstart(git_cmd, {
    cwd = dir,
    on_stdout = function(_, data, name)
      local head = data[1]
      if head ~= "" then
        vim.api.nvim_buf_set_var(buffer, "git_head", head)
      end
    end,
    on_stderr = function(_, data, _)
      if data[1] ~= "" then
        pcall(vim.api.nvim_buf_del_var, buffer, "git_head")
      end
    end,
  })
end

return M
