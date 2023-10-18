-- [nfnl] Compiled from fnl/plugins/unimpaired.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local ignored_mappings = {"<s", "<s<Esc>", ">s", ">s<Esc>"}
local function config()
  for _, lhs in ipairs(ignored_mappings) do
    pcall(vim.api.nvim_del_keymap, "n", lhs)
  end
  return which_key.register({["["] = {name = "previous|above|up|enable", ["<C-L>"] = {"<Plug>(unimpaired-lpfile)", "Jump to previous file in location list"}, ["<C-Q>"] = {"<Plug>(unimpaired-cpfile)", "Previous file in quickfix list"}, ["<C-T>"] = {"<Plug>(unimpaired-ptprevious)", "Preview previous tag"}, ["<Space>"] = {"<Plug>(unimpaired-blank-up)", "Add blank line above"}, a = {"<Plug>(unimpaired-previous)", "Previous file in argument list"}, A = {"<Plug>(unimpaired-first)", "First file in argument list"}, b = {"<Plug>(unimpaired-bprevios)", "Previous buffer"}, B = {"<Plug>(unimpaired-bfirst)", "First buffer"}, C = {"<Plug>(unimpaired-string-encode)", "Encode string"}, e = {"<Plug>(unimpaired-move-up)", "Exchange with lines above"}}, ["]"] = {name = "next|below|down|disable", ["<C-L>"] = {"<Plug>(unimpaired-lnfile)", "Jump to next file in location list"}, ["<C-Q>"] = {"<Plug>(unimpaired-cnfile)", "Next file in quickfix list"}, ["<C-T>"] = {"<Plug>(unimpaired-ptnext)", "Preview next tag"}, ["<Space>"] = {"<Plug>(unimpaired-blank-down)", "Add blank line below"}, a = {"<Plug>(unimpaired-next)", "Next file in argument list"}, A = {"<Plug>(unimpaired-last)", "Last file in argument list"}, b = {"<Plug>(unimpaired-bnext)", "Next buffer"}, B = {"<Plug>(unimpaired-blast)", "Last buffer"}, C = {"<Plug>(unimpaired-string-decode)", "Decode string"}, e = {"<Plug>(unimpaired-move-down)", "Exchange with lines below"}}})
end
return {"tpope/vim-unimpaired", config = config}
