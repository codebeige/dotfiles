-- [nfnl] Compiled from fnl/lib/core.fnl by https://github.com/Olical/nfnl, do not edit.
local function conj(t, ...)
  local t_2a = (t or {})
  for _, v in ipairs({...}) do
    table.insert(t_2a, v)
  end
  return t_2a
end
local deep_merge
local function _1_(...)
  return vim.tbl_deep_extend("keep", ...)
end
deep_merge = _1_
return {conj = conj, ["deep-merge"] = deep_merge}
