-- [nfnl] Compiled from fnl/lib/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local loader = autoload("lualine.utils.loader")
local function theme_name()
  local _2_ = vim.g.colors_name
  if (_2_ == nil) then
    return "auto"
  elseif (nil ~= _2_) then
    local theme = _2_
    return string.gsub(vim.g.colors_name, "^base16%-", "")
  else
    return nil
  end
end
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
local function get_theme()
  local _4_, _5_ = pcall(loader.load_theme, theme_name())
  if ((_4_ == true) and (nil ~= _5_)) then
    local theme = _5_
    return theme
  elseif true then
    local _ = _4_
    return make_theme()
  else
    return nil
  end
end
return {["get-theme"] = get_theme}
