local _2afile_2a = "/Users/tc/.config/nvim/fnl/config/fennel.fnl"
local _2amodule_name_2a = "config.fennel"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local function update_syntax()
  local patterns = vim.g.fennel_fuzzy_indent_patterns
  table.insert(patterns, "^with-")
  table.insert(patterns, "^doto$")
  table.insert(patterns, "^fcollect$")
  table.insert(patterns, "^faccumulate$")
  vim.g.fennel_fuzzy_indent_patterns = patterns
  return nil
end
_2amodule_2a["update-syntax"] = update_syntax
local function init()
  do
    local group = vim.api.nvim_create_augroup("config.fennel", {clear = true})
    vim.api.nvim_create_autocmd("FileType", {callback = update_syntax, group = group, once = true, pattern = "fennel"})
  end
  vim.cmd.digraph("fn", 955)
  return true
end
_2amodule_locals_2a["init"] = init
local loaded_3f = ((_2amodule_2a)["loaded?"] or init())
do end (_2amodule_locals_2a)["loaded?"] = loaded_3f
return _2amodule_2a