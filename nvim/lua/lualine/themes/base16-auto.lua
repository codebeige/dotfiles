local _2afile_2a = "/Users/tc/.config/nvim/fnl/lualine/themes/base16-auto.fnl"
local _2amodule_name_2a = "lualine.themes.base16-auto"
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
  return string.gsub(vim.g.colors_name, "^base16%-", "")
end
_2amodule_locals_2a["theme-name"] = theme_name
do
  local ok, theme = pcall(loader.load_theme, theme_name())
  if (ok and theme) then
    return theme
  else
  end
end
local colors = {bg = vim.g.base16_gui01, alt_bg = vim.g.base16_gui02, dark_fg = vim.g.base16_gui03, fg = vim.g.base16_gui04, light_fg = vim.g.base16_gui05, normal = vim.g.base16_gui0D, insert = vim.g.base16_gui0B, visual = vim.g.base16_gui0E, replace = vim.g.base16_gui09}
_2amodule_locals_2a["colors"] = colors
local normal = {a = {fg = colors.bg, bg = colors.normal}, b = {fg = colors.light_fg, bg = colors.alt_bg}, c = {fg = colors.fg, bg = colors.bg}}
_2amodule_2a["normal"] = normal
local command = normal
_2amodule_2a["command"] = command
local replace = {a = {fg = colors.bg, bg = colors.replace}, b = {fg = colors.light_fg, bg = colors.alt_bg}}
_2amodule_2a["replace"] = replace
local insert = {a = {fg = colors.bg, bg = colors.insert}, b = {fg = colors.light_fg, bg = colors.alt_bg}}
_2amodule_2a["insert"] = insert
local terminal = insert
_2amodule_2a["terminal"] = terminal
local visual = {a = {fg = colors.bg, bg = colors.visual}, b = {fg = colors.light_fg, bg = colors.alt_bg}}
_2amodule_2a["visual"] = visual
local inactive = {a = {fg = colors.dark_fg, bg = colors.bg}, b = {fg = colors.dark_fg, bg = colors.bg}, c = {fg = colors.dark_fg, bg = colors.bg}}
_2amodule_2a["inactive"] = inactive
return _2amodule_2a