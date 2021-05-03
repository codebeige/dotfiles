local M = {}

function default_params()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return {
    vim.uri_from_bufnr(0),
    cursor[1] - 1,
    cursor[2]
  }
end

function M.cycle_coll()
  vim.lsp.buf.execute_command{
    command = "cycle-coll",
    arguments = default_params()
  }
end

return M
