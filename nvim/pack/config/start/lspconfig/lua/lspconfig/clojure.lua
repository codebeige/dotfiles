local M = {}

function M.buf_set_keymap_repeat(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    mode,
    lhs,
    string.format("%s<Cmd>silent! call repeat#set('%s')<CR>", rhs, lhs),
    opts
  )
end

local function pos_comparator(left, right)
  if left[1] == right[1] then
    return left[2] < right[2]
  end
  return left[1] < right[2]
end

local function search_pos_open()
  local opts = "nzbcW"
  local positions = {
    vim.fn.searchpairpos([[\M(]], "",[[\M)]], opts),
    vim.fn.searchpairpos([[\M[]], "",[=[\M]]=], opts),
    vim.fn.searchpairpos([[\M#\?{]], "",[[\M}]], opts),
  }
  table.sort(positions, pos_comparator)
  return positions[#positions]
end

function M.cycle_coll()
  local pos = search_pos_open()
  if pos[1] == 0 then
    return
  end
  vim.lsp.buf.execute_command{
    command = "cycle-coll",
    arguments = {
      vim.uri_from_bufnr(),
      pos[1] - 1,
      pos[2] - 1,
    },
  }
end

return M
