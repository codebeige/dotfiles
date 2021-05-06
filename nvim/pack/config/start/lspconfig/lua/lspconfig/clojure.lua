local M = {}

function M.buf_set_keymap_repeat(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    mode,
    lhs,
    string.format(
      '%s<Cmd>silent! call repeat#set("%s")<CR>',
      rhs,
      lhs:gsub('<', [[\<]])
    ),
    opts
  )
end

local function default_params()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return {
    vim.uri_from_bufnr(0),
    cursor[1] - 1,
    cursor[2]
  }
end

local function cursor_on_opening()
  local column = vim.api.nvim_win_get_cursor(0)[2] + 1
  local line = vim.api.nvim_get_current_line():sub(column)
  return line:find('^[([{]') or line:find('^#{')
end

function M.cycle_coll()
  local winview = vim.fn.winsaveview()
  if not cursor_on_opening() then
    vim.cmd('keepjumps normal (')
  end
  vim.lsp.buf.execute_command{
    command = "cycle-coll",
    arguments = default_params()
  }
  vim.fn.winrestview(winview)
end

return M
