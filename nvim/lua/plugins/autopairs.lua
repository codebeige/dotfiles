local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/autopairs.fnl"
local _2amodule_name_2a = "plugins.autopairs"
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
local a, autopairs, sexp = autoload("aniseed.core"), autoload("nvim-autopairs"), autoload("plugins.sexp")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["autopairs"] = autopairs
_2amodule_locals_2a["sexp"] = sexp
local disabled_filetypes = a.concat({"", "TelescopePrompt"}, sexp.filetypes)
do end (_2amodule_locals_2a)["disabled-filetypes"] = disabled_filetypes
local function config()
  return autopairs.setup({check_ts = true, disable_filetype = disabled_filetypes})
end
_2amodule_2a["config"] = config
return _2amodule_2a