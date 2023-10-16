-- [nfnl] Compiled from fnl/config/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local loaded_3f = false
local function update_syntax()
  local patterns = vim.g.fennel_fuzzy_indent_patterns
  table.insert(patterns, "^with-")
  table.insert(patterns, "^doto$")
  table.insert(patterns, "^fcollect$")
  table.insert(patterns, "^faccumulate$")
  vim.g.fennel_fuzzy_indent_patterns = patterns
  return nil
end
local function init()
  do
    local group = vim.api.nvim_create_augroup("config.fennel", {clear = true})
    vim.api.nvim_create_autocmd("FileType", {callback = update_syntax, group = group, once = true, pattern = "fennel"})
  end
  vim.cmd.digraph("fn", 955)
  return true
end
loaded_3f = init()
return nil
