local _2afile_2a = "/Users/tc/.config/nvim/fnl/config/mappings.fnl"
local _2amodule_name_2a = "config.mappings"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, which_key = autoload("aniseed.core"), autoload("which-key")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["which-key"] = which_key
which_key.register({["<CR>"] = {":", "Enter command..."}, b = {name = "buffer", q = {"<Cmd>confirm quit<CR>`", "Quit window"}, Q = {"<Cmd>confirm quitall<CR>", "Quit all windows"}, r = {"<Cmd>checktime %<CR>", "Refresh buffer"}, R = {"<Cmd>checktime<CR>", "Refresh all buffers"}, s = {":<C-U>%s/", "Substitute in buffer..."}, u = {"<Cmd>update<CR>", "Update buffer"}, w = {"<Cmd>write<CR>", "Write buffer"}, W = {"<Cmd>wall<CR>", "Write all buffers"}, x = {"<Cmd>exit<CR>", "Exit buffer"}, X = {"<Cmd>xqall<CR>", "Exit all buffers"}}, c = {name = "quickfix list", s = {":<C-U>cdo s/", "Substitute each quickfix entry..."}}, l = {name = "location list", s = {":<C-U>ldo s/", "Substitute each location entry..."}}}, {prefix = "<Leader>", silent = false})
which_key.register({["<CR>"] = a.merge({":", "Enter command..."}, {silent = false}), s = a.merge({":s/", "Substitute in selection..."}, {silent = false})}, {prefix = "<Leader>", mode = "x"})
which_key.register({["<C-L>"] = {"<Esc>", "Esc"}}, {mode = "i"})
return _2amodule_2a