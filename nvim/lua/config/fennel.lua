-- [nfnl] Compiled from fnl/config/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local loaded_3f = false
local function update_syntax()
  local patterns = (vim.g.fennel_fuzzy_indent_patterns or {})
  table.insert(patterns, "^with-")
  table.insert(patterns, "^doto$")
  table.insert(patterns, "^fcollect$")
  table.insert(patterns, "^faccumulate$")
  vim.g.fennel_fuzzy_indent_patterns = patterns
  return nil
end
local function init()
  do
    local group = vim.api.nvim_create_augroup("config_fennel", {clear = true})
    vim.api.nvim_create_autocmd("FileType", {callback = update_syntax, group = group, once = true, pattern = "fennel"})
  end
  vim.cmd.digraph("fn", 955)
  loaded_3f = true
  return nil
end
return {init = init}
