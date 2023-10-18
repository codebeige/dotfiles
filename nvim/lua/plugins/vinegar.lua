-- [nfnl] Compiled from fnl/plugins/vinegar.fnl by https://github.com/Olical/nfnl, do not edit.
local function config()
  vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
  return nil
end
return {"tpope/vim-vinegar", config = config}
