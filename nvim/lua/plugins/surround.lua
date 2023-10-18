-- [nfnl] Compiled from fnl/plugins/surround.fnl by https://github.com/Olical/nfnl, do not edit.
local function init()
  vim.g.surround_no_insert_mappings = true
  return nil
end
return {"tpope/vim-surround", init = init}
