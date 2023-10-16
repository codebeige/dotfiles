-- [nfnl] Compiled from fnl/snippets/all.fnl by https://github.com/Olical/nfnl, do not edit.
local s = require("lib.snippet")
local defsnippet
local function _1_(...)
  return s.defsnippet("all", ...)
end
defsnippet = _1_
return defsnippet("lipsum", s.t("Lorem ipsum dolor sic amet"))
