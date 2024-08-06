-- [nfnl] Compiled from fnl/lib/highlight.fnl by https://github.com/Olical/nfnl, do not edit.
local border = {"\226\149\173", "\226\148\128", "\226\149\174", "\226\148\130", "\226\149\175", "\226\148\128", "\226\149\176", "\226\148\130"}
local function get_hl(name)
  local _1_ = vim.api.nvim_get_hl(0, {name = name})
  if ((_G.type(_1_) == "table") and (nil ~= _1_.link)) then
    local link = _1_.link
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
    local tbl_16_auto = {italic = true}
    for k, v in pairs(hl) do
      local k_17_auto, v_18_auto = k, v
      if ((k_17_auto ~= nil) and (v_18_auto ~= nil)) then
        tbl_16_auto[k_17_auto] = v_18_auto
      else
      end
    end
    return tbl_16_auto
  end
  return vim.api.nvim_set_hl(0, name, _3_())
end
local function link(name, target)
  return vim.api.nvim_set_hl(0, name, {link = target})
end
return {border = border, link = link, ["make-italic"] = make_italic}
