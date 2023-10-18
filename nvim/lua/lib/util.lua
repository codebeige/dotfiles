-- [nfnl] Compiled from fnl/lib/util.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl = autoload("nfnl.core")
local str = autoload("nfnl.string")
local function set_opts(prefix, opts)
  for k, v in pairs(opts) do
    local _let_2_ = str.split(prefix, ":")
    local scope = _let_2_[1]
    local prefix_2a = _let_2_[2]
    nfnl["assoc-in"](vim, {scope, str.join("", {prefix_2a, k})}, v)
  end
  return nil
end
local function map(mode, from, to, opts)
  return vim.api.nvim_set_keymap(mode, from, to, nfnl.merge({noremap = true}, opts))
end
local function map_21(mode, from, to, opts)
  return map(mode, from, to, nfnl.assoc(opts, "silent", true))
end
local function bmap(bufnr, mode, from, to, opts)
  return vim.api.nvim_buf_set_keymap(bufnr, mode, from, to, nfnl.merge({noremap = true}, opts))
end
local function bmap_21(bufnr, mode, from, to, opts)
  return bmap(bufnr, mode, from, to, nfnl.assoc(opts, "silent", true))
end
return {["set-opts"] = set_opts, map = map, ["map!"] = map_21, bmap = bmap, ["bmap!"] = bmap_21}
