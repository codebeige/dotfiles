-- [nfnl] Compiled from fnl/plugins/qf.fnl by https://github.com/Olical/nfnl, do not edit.
local function init()
  vim.g.qf_mapping_ack_style = true
  return nil
end
return {"romainl/vim-qf", init = init}
