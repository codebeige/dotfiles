local _2afile_2a = "/Users/tc/.config/nvim/fnl/lib/util.fnl"
local _2amodule_name_2a = "lib.util"
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
local a, nvim, str = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
local function set_opts(prefix, opts)
  for k, v in pairs(opts) do
    local _let_1_ = str.split(prefix, ":")
    local scope = _let_1_[1]
    local prefix_2a = _let_1_[2]
    a["assoc-in"](nvim, {scope, str.join("", {prefix_2a, k})}, v)
  end
  return nil
end
_2amodule_2a["set-opts"] = set_opts
local function map(mode, from, to, opts)
  return nvim.set_keymap(mode, from, to, a.merge({noremap = true}, opts))
end
_2amodule_2a["map"] = map
local function map_21(mode, from, to, opts)
  return map(mode, from, to, a.assoc(opts, "silent", true))
end
_2amodule_2a["map!"] = map_21
local function bmap(bufnr, mode, from, to, opts)
  return nvim.buf_set_keymap(bufnr, mode, from, to, a.merge({noremap = true}, opts))
end
_2amodule_2a["bmap"] = bmap
local function bmap_21(bufnr, mode, from, to, opts)
  return bmap(bufnr, mode, from, to, a.assoc(opts, "silent", true))
end
_2amodule_2a["bmap!"] = bmap_21
return _2amodule_2a