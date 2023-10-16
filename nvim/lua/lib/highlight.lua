local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/highlight.fnl"
local _2amodule_name_2a = "lib.highlight"
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
local nvim, util = autoload("aniseed.nvim"), autoload("aniseed.nvim.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
local function get_hl(name)
  local _, _0, hl = nil, nil, nil
  local function _1_(...)
    return nvim.ex.silent("highlight", name, ...)
  end
  _, _0, hl = string.find(util["with-out-str"](_1_), "xxx (.*)\n")
  local _2_, _3_, _4_ = string.find(hl, "links to (%a+)")
  if (_2_ == nil) then
    return hl
  elseif (true and true and (nil ~= _4_)) then
    local _1 = _2_
    local _2 = _3_
    local n = _4_
    return get_hl(n)
  else
    return nil
  end
end
_2amodule_locals_2a["get-hl"] = get_hl
local function conj_val(vals, v)
  if string.find(vals, v) then
    return vals
  else
    return (vals .. "," .. v)
  end
end
_2amodule_locals_2a["conj-val"] = conj_val
local function conj_hl(hl, k, v)
  local prefix = (k .. "=")
  local _7_, _8_ = nil, nil
  local function _9_(_241)
    return (prefix .. conj_val(_241, v))
  end
  _7_, _8_ = string.gsub(hl, (prefix .. "(%a+)"), _9_, 1)
  if ((nil ~= _7_) and (_8_ == 1)) then
    local hl_2a = _7_
    return hl_2a
  elseif ((nil ~= _7_) and (_8_ == 0)) then
    local hl_2a = _7_
    return (hl_2a .. " " .. prefix .. v)
  else
    return nil
  end
end
_2amodule_locals_2a["conj-hl"] = conj_hl
local function make_italic(name)
  return nvim.ex.highlight(name, conj_hl(get_hl(name), "gui", "italic"))
end
_2amodule_2a["make-italic"] = make_italic
return _2amodule_2a