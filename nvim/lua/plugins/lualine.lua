local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/lualine.fnl"
local _2amodule_name_2a = "plugins.lualine"
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
local autoload = (require("aniseed.autoload")).autoload
local lualine, nvim, theme, util, _local_1_ = autoload("lualine"), autoload("aniseed.nvim"), autoload("lib.lualine.theme"), autoload("lib.util"), require("lib.lualine")
local _local_2_ = _local_1_
local get_theme = _local_2_["get-theme"]
_2amodule_locals_2a["lualine"] = lualine
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["theme"] = theme
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["get-theme"] = get_theme
local fugitive_commit_name_regex = vim.regex("\\v^fugitive:%(//)=.{-}\\zs%(//|::)%(\\x{8}|[1-3])")
do end (_2amodule_locals_2a)["fugitive-commit-name-regex"] = fugitive_commit_name_regex
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
_2amodule_locals_2a["fugitive-commit-name*"] = fugitive_commit_name_2a
local function fugitive_commit_name()
  return fugitive_commit_name_2a(nvim.buf_get_name(0))
end
_2amodule_2a["fugitive-commit-name"] = fugitive_commit_name
local focused_win_id = 0
local function statusline()
  if (vim.fn.mode() ~= "c") then
    focused_win_id = tonumber(vim.g.actual_curwin)
  else
  end
  return lualine.statusline((focused_win_id == vim.fn.win_getid()))
end
_2amodule_2a["statusline"] = statusline
local function config()
  lualine.setup({inactive_sections = {lualine_c = {fugitive_commit_name, "filename"}}, options = {theme = get_theme, icons_enabled = false}, sections = {lualine_c = {fugitive_commit_name, "filename"}}})
  return util["set-opts"]("o", {statusline = "%{%v:lua.require'plugins.lualine'.statusline()%}", showmode = false})
end
_2amodule_2a["config"] = config
return _2amodule_2a