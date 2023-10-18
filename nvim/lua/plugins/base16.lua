-- [nfnl] Compiled from fnl/plugins/base16.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local fwatch = autoload("fwatch")
local nfnl = autoload("nfnl.core")
local str = autoload("nfnl.string")
local colorscheme_file = nfnl.str(os.getenv("HOME"), "/.colortheme")
local function current()
  local _2_ = nfnl.slurp(colorscheme_file, true)
  if (nil ~= _2_) then
    local name = _2_
    return string.gsub(str.trim(name), "-256$", "")
  elseif true then
    local _ = _2_
    return "base16-tomorrow-night-eighties"
  else
    return nil
  end
end
local function update()
  local name = current()
  if (name ~= vim.g.colors_name) then
    return vim.cmd.colorscheme(name)
  else
    return nil
  end
end
local function config()
  update()
  return fwatch.watch(colorscheme_file, {on_event = vim.schedule_wrap(update)})
end
return {update = update, config = config}
