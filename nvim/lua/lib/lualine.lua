local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/lualine.fnl"
local _2amodule_name_2a = "lib.lualine"
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
local loader = autoload("lualine.utils.loader")
do end (_2amodule_locals_2a)["loader"] = loader
local function theme_name()
  local _1_ = vim.g.colors_name
  if (_1_ == nil) then
    return "auto"
  elseif (nil ~= _1_) then
    local theme = _1_
    return string.gsub(vim.g.colors_name, "^base16%-", "")
  else
    return nil
  end
end
_2amodule_locals_2a["theme-name"] = theme_name
local function make_theme()
  local bg = ("#" .. vim.g.base16_gui01)
  local alt_bg = ("#" .. vim.g.base16_gui02)
  local dark_fg = ("#" .. vim.g.base16_gui03)
  local fg = ("#" .. vim.g.base16_gui04)
  local light_fg = ("#" .. vim.g.base16_gui05)
  local normal = ("#" .. vim.g.base16_gui0D)
  local insert = ("#" .. vim.g.base16_gui0B)
  local visual = ("#" .. vim.g.base16_gui0E)
  local replace = ("#" .. vim.g.base16_gui09)
  return {normal = {a = {fg = bg, bg = normal}, b = {fg = light_fg, bg = alt_bg}, c = {fg = fg, bg = bg}}, command = {a = {fg = bg, bg = normal}, b = {fg = light_fg, bg = alt_bg}, c = {fg = fg, bg = bg}}, replace = {a = {fg = bg, bg = replace}, b = {fg = light_fg, bg = alt_bg}}, insert = {a = {fg = bg, bg = insert}, b = {fg = light_fg, bg = alt_bg}}, terminal = {a = {fg = bg, bg = insert}, b = {fg = light_fg, bg = alt_bg}}, visual = {a = {fg = bg, bg = insert}, b = {fg = light_fg, bg = alt_bg}}, inactive = {a = {fg = dark_fg, bg = bg}, b = {fg = dark_fg, bg = bg}, c = {fg = dark_fg, bg = bg}}}
end
_2amodule_locals_2a["make-theme"] = make_theme
local function get_theme()
  local _3_, _4_ = pcall(loader.load_theme, theme_name())
  if ((_3_ == true) and (nil ~= _4_)) then
    local theme = _4_
    return theme
  elseif true then
    local _ = _3_
    return make_theme()
  else
    return nil
  end
end
_2amodule_2a["get-theme"] = get_theme
return _2amodule_2a