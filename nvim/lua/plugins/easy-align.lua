-- [nfnl] Compiled from fnl/plugins/easy-align.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local motion_maps = {ga = {"<Plug>(EasyAlign)", "align"}, gA = {"<Plug>(LiveEasyAlign)", "align with preview"}}
local function config()
  which_key.register(motion_maps)
  which_key.register(motion_maps, {mode = "x"})
  which_key.register({name = "align", ["<CR>"] = {"<Cmd>EasyAlign<CR>", "align ..."}, p = {"<Cmd>LiveEasyAlign<CR>", "align with preview ..."}}, {prefix = "<Leader>a", silent = false})
  which_key.register({[","] = {"gaip*,", "align on commas"}, ["."] = {"gaip.", "align on leading dot"}, ["/"] = {"gaip*<C-R>", "align on regex..."}, [":"] = {"gaip*:", "align on colons"}, ["<Space>"] = {"gaip ", "align on first space"}, ["="] = {"gaip*=", "align on equal signs"}, t = {"gaip*|", "align table"}}, {prefix = "<Leader>a", noremap = false})
  return which_key.register({["<CR>"] = {"<Plug>(EasyAlign)", "align ..."}, [","] = {"ga*,", "align on commas"}, ["."] = {"ga.", "align on leading dot"}, ["/"] = {"ga*<C-R>", "align on regex..."}, [":"] = {"ga*:", "align on colons"}, ["<Space>"] = {"ga ", "align on first space"}, ["="] = {"ga*=", "align on equal signs"}, p = {"<Plug>(LiveEasyAlign)", "align with preview ..."}, t = {"ga*|", "align table"}}, {mode = "x", prefix = "<Leader>a", noremap = false})
end
return {config = config}
