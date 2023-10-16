local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/base16.fnl"
local _2amodule_name_2a = "plugins.base16"
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
local a, fwatch, nvim, str = autoload("aniseed.core"), autoload("fwatch"), autoload("aniseed.nvim"), autoload("aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["fwatch"] = fwatch
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
local colorscheme_file = a.str(os.getenv("HOME"), "/.colortheme")
do end (_2amodule_locals_2a)["colorscheme-file"] = colorscheme_file
local function current()
  local _1_ = a.slurp(colorscheme_file, true)
  if (nil ~= _1_) then
    local name = _1_
    return string.gsub(str.trim(name), "-256$", "")
  elseif true then
    local _ = _1_
    return "base16-tomorrow-night-eighties"
  else
    return nil
  end
end
_2amodule_locals_2a["current"] = current
local function update()
  local name = current()
  if (name ~= vim.g.colors_name) then
    return nvim.ex.colorscheme(name)
  else
    return nil
  end
end
_2amodule_2a["update"] = update
local function config()
  update()
  return fwatch.watch(colorscheme_file, {on_event = vim.schedule_wrap(update)})
end
_2amodule_2a["config"] = config
return _2amodule_2a