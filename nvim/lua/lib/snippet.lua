-- [nfnl] Compiled from fnl/lib/snippet.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lib = autoload("lib.core")
local luasnip = autoload("luasnip")
local nfnl = autoload("nfnl.core")
local function defsnippet(scope, ...)
  local s = luasnip.snippet(...)
  local function _2_(_241)
    return lib.conj(_241, s)
  end
  return nfnl["update-in"](luasnip, {"snippets", scope}, _2_)
end
local t = luasnip.text_node
return {defsnippet = defsnippet, t = t}
