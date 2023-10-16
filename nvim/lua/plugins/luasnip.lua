local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/luasnip.fnl"
local _2amodule_name_2a = "plugins.luasnip"
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
local util, _ = autoload("lib.util"), require("snippets.all")
do end (_2amodule_locals_2a)["util"] = util
_2amodule_locals_2a["_"] = _
local mappings = {["<C-J>"] = "expand_or_jump()", ["<C-K>"] = "jump(-1)"}
_2amodule_locals_2a["mappings"] = mappings
local function cmd__3eviml(cmd)
  return string.format("<Cmd>lua require('luasnip').%s<CR>", cmd)
end
_2amodule_locals_2a["cmd->viml"] = cmd__3eviml
local function config()
  for k, cmd in pairs(mappings) do
    util.map("i", k, cmd__3eviml(cmd))
    util.map("s", k, cmd__3eviml(cmd))
  end
  return nil
end
_2amodule_2a["config"] = config
return _2amodule_2a