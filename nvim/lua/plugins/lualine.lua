-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lualine = autoload("lualine")
local theme = autoload("lib.lualine.theme")
local _local_2_ = autoload("lib.lualine")
local get_theme = _local_2_["get-theme"]
local util = autoload("lib.util")
local fugitive_commit_name_regex = vim.regex("\\v^fugitive:%(//)=.{-}\\zs%(//|::)%(\\x{8}|[1-3])")
local function fugitive_commit_name_2a(fugitive_url)
  local _3_, _4_ = fugitive_commit_name_regex:match_str(fugitive_url)
  local function _5_()
    local start = _3_
    local _end = _4_
    return (8 < (_end - start))
  end
  if (((nil ~= _3_) and (nil ~= _4_)) and _5_()) then
    local start = _3_
    local _end = _4_
    return string.sub(fugitive_url, (start + 3), _end)
  elseif ((nil ~= _3_) and (nil ~= _4_)) then
    local start = _3_
    local _end = _4_
    return string.sub(fugitive_url, (start + 1), _end)
  elseif (_3_ == nil) then
    return ""
  else
    return nil
  end
end
local function fugitive_commit_name()
  return fugitive_commit_name_2a(nvim.buf_get_name(0))
end
local focused_win_id = 0
local function statusline()
  if (vim.fn.mode() ~= "c") then
    focused_win_id = tonumber(vim.g.actual_curwin)
  else
  end
  return lualine.statusline((focused_win_id == vim.fn.win_getid()))
end
local function config()
  lualine.setup({inactive_sections = {lualine_c = {fugitive_commit_name, "filename"}}, options = {theme = get_theme, icons_enabled = false}, sections = {lualine_c = {fugitive_commit_name, "filename"}}})
  return util["set-opts"]("o", {statusline = "%{%v:lua.require'plugins.lualine'.statusline()%}", showmode = false})
end
return {config = config, ["fugitive-commit-name"] = fugitive_commit_name, statusline = statusline}
