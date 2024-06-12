-- [nfnl] Compiled from fnl/lib/highlight.fnl by https://github.com/Olical/nfnl, do not edit.
local function get_hl(name)
  local _1_ = vim.api.nvim_get_hl(0, {name = name})
  if ((_G.type(_1_) == "table") and (nil ~= (_1_).link)) then
    local link = (_1_).link
    return get_hl(link)
  elseif (nil ~= _1_) then
    local hl = _1_
    return hl
  else
    return nil
  end
end
local function make_italic(name)
  local hl = get_hl(name)
  local function _3_()
    local tbl_14_auto = {italic = true}
    for k, v in pairs(hl) do
      local k_15_auto, v_16_auto = k, v
      if ((k_15_auto ~= nil) and (v_16_auto ~= nil)) then
        tbl_14_auto[k_15_auto] = v_16_auto
      else
      end
    end
    return tbl_14_auto
  end
  return vim.api.nvim_set_hl(0, name, _3_())
end
local function link(name, target)
  return vim.api.nvim_set_hl(0, name, {link = target})
end
return {link = link, ["make-italic"] = make_italic}
