local M = {}

function M.buf_set_keymap_repeat(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    mode,
    lhs,
    string.format(
      '%s<Cmd>silent! call repeat#set("%s")<CR>',
      rhs,
      string.gsub(lhs, '<', [[\<]])
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

function M.cycle_coll()
  local winview = vim.fn.winsaveview()
  vim.cmd('normal vaf%v')
  vim.lsp.buf.execute_command{
    command = "cycle-coll",
    arguments = default_params()
  }
  vim.fn.winrestview(winview)
end

return M
