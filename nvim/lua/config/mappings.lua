-- [nfnl] Compiled from fnl/config/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local which_key = require("which-key")
local nfnl = require("nfnl.core")
which_key.register({["<CR>"] = {":", "Enter command..."}, b = {name = "buffer", q = {"<Cmd>confirm quit<CR>`", "Quit window"}, Q = {"<Cmd>confirm quitall<CR>", "Quit all windows"}, r = {"<Cmd>checktime %<CR>", "Refresh buffer"}, R = {"<Cmd>checktime<CR>", "Refresh all buffers"}, s = {":<C-U>%s/", "Substitute in buffer..."}, u = {"<Cmd>update<CR>", "Update buffer"}, w = {"<Cmd>write<CR>", "Write buffer"}, W = {"<Cmd>wall<CR>", "Write all buffers"}, x = {"<Cmd>exit<CR>", "Exit buffer"}, X = {"<Cmd>xqall<CR>", "Exit all buffers"}}, c = {name = "quickfix list", s = {":<C-U>cdo s/", "Substitute each quickfix entry..."}}, l = {name = "location list", s = {":<C-U>ldo s/", "Substitute each location entry..."}}}, {prefix = "<Leader>", silent = false})
which_key.register({["<CR>"] = nfnl.merge({":", "Enter command..."}, {silent = false}), s = nfnl.merge({":s/", "Substitute in selection..."}, {silent = false})}, {prefix = "<Leader>", mode = "x"})
return which_key.register({["<C-L>"] = {"<Esc>", "Esc"}}, {mode = "i"})
