local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/unimpaired.fnl"
local _2amodule_name_2a = "plugins.unimpaired"
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
local nvim, which_key = autoload("aniseed.nvim"), autoload("which-key")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["which-key"] = which_key
local ignored_mappings = {"<s", "<s<Esc>", ">s", ">s<Esc>"}
_2amodule_locals_2a["ignored-mappings"] = ignored_mappings
local function config()
  for _, lhs in ipairs(ignored_mappings) do
    pcall(nvim.del_keymap, "n", lhs)
  end
  return which_key.register({["["] = {["<C-L>"] = {"<Plug>(unimpaired-lpfile)", "Jump to previous file in location list"}, ["<C-Q>"] = {"<Plug>(unimpaired-cpfile)", "Previous file in quickfix list"}, ["<C-T>"] = {"<Plug>(unimpaired-ptprevious)", "Preview previous tag"}, ["<Space>"] = {"<Plug>(unimpaired-blank-up)", "Add blank line above"}, a = {"<Plug>(unimpaired-previous)", "Previous file in argument list"}, A = {"<Plug>(unimpaired-first)", "First file in argument list"}, b = {"<Plug>(unimpaired-bprevios)", "Previous buffer"}, B = {"<Plug>(unimpaired-bfirst)", "First buffer"}, C = {"<Plug>(unimpaired-string-encode)", "Encode string"}, e = {"<Plug>(unimpaired-move-up)", "Exchange with lines above"}}})
end
_2amodule_2a["config"] = config
return _2amodule_2a