local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/easy-align.fnl"
local _2amodule_name_2a = "plugins.easy-align"
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
local which_key = autoload("which-key")
do end (_2amodule_locals_2a)["which-key"] = which_key
local motion_maps = {ga = {"<Plug>(EasyAlign)", "align"}, gA = {"<Plug>(LiveEasyAlign)", "align with preview"}}
_2amodule_locals_2a["motion-maps"] = motion_maps
local function config()
  which_key.register(motion_maps)
  which_key.register(motion_maps, {mode = "x"})
  which_key.register({name = "align", ["<CR>"] = {"<Cmd>EasyAlign<CR>", "align ..."}, p = {"<Cmd>LiveEasyAlign<CR>", "align with preview ..."}}, {prefix = "<Leader>a", silent = false})
  which_key.register({[","] = {"gaip*,", "align on commas"}, ["."] = {"gaip.", "align on leading dot"}, ["/"] = {"gaip*<C-R>", "align on regex..."}, [":"] = {"gaip*:", "align on colons"}, ["<Space>"] = {"gaip ", "align on first space"}, ["="] = {"gaip*=", "align on equal signs"}, t = {"gaip*|", "align table"}}, {prefix = "<Leader>a", noremap = false})
  return which_key.register({["<CR>"] = {"<Plug>(EasyAlign)", "align ..."}, [","] = {"ga*,", "align on commas"}, ["."] = {"ga.", "align on leading dot"}, ["/"] = {"ga*<C-R>", "align on regex..."}, [":"] = {"ga*:", "align on colons"}, ["<Space>"] = {"ga ", "align on first space"}, ["="] = {"ga*=", "align on equal signs"}, p = {"<Plug>(LiveEasyAlign)", "align with preview ..."}, t = {"ga*|", "align table"}}, {mode = "x", prefix = "<Leader>a", noremap = false})
end
_2amodule_2a["config"] = config
return _2amodule_2a