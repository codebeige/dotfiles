-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local nfnl = autoload("nfnl.core")
local function init()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
  return nil
end
local function config()
  which_key.setup()
  which_key.register({["["] = "previous|above|up|enable", ["]"] = "next|below|down|disable"})
  which_key.register({["<CR>"] = {":", "Enter command..."}, b = {name = "buffer", q = {"<Cmd>confirm quit<CR>`", "Quit window"}, Q = {"<Cmd>confirm quitall<CR>", "Quit all windows"}, r = {"<Cmd>checktime %<CR>", "Refresh buffer"}, R = {"<Cmd>checktime<CR>", "Refresh all buffers"}, s = {":<C-U>%s/", "Substitute in buffer..."}, u = {"<Cmd>update<CR>", "Update buffer"}, w = {"<Cmd>write<CR>", "Write buffer"}, W = {"<Cmd>wall<CR>", "Write all buffers"}, x = {"<Cmd>exit<CR>", "Exit buffer"}, X = {"<Cmd>xqall<CR>", "Exit all buffers"}}, c = {name = "quickfix list", s = {":<C-U>cdo s/", "Substitute each quickfix entry..."}}, l = {name = "location list", s = {":<C-U>ldo s/", "Substitute each location entry..."}}}, {prefix = "<Leader>", silent = false})
  which_key.register({["<CR>"] = nfnl.merge({":", "Enter command..."}, {silent = false}), s = nfnl.merge({":s/", "Substitute in selection..."}, {silent = false})}, {prefix = "<Leader>", mode = "x"})
  return which_key.register({["<C-L>"] = {"<Esc>", "Esc"}}, {mode = "i"})
end
return {"folke/which-key.nvim", init = init, config = config, event = "VeryLazy"}
