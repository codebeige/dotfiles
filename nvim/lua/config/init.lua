local _2afile_2a = "/Users/tc/.config/nvim/fnl/config/init.fnl"
local _2amodule_name_2a = "config.init"
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
local nvim, scratch, util, _, _0, _1, _2, _3 = autoload("aniseed.nvim"), autoload("codebeige.scratch"), autoload("lib.util"), require("config.diagnostic"), require("config.fennel"), require("config.highlight"), require("config.mappings"), require("plugins.init")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["scratch"] = scratch
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["_"] = _3
_2amodule_locals_2a["_"] = _3
_2amodule_locals_2a["_"] = _3
_2amodule_locals_2a["_"] = _3
_2amodule_locals_2a["_"] = _3
nvim.ex.language("en_US.UTF-8")
util["set-opts"]("o", {colorcolumn = "80", completeopt = "menu,menuone,noselect", cursorline = true, diffopt = ("vertical," .. vim.o.diffopt), expandtab = true, ignorecase = true, inccommand = "split", listchars = "tab:\226\134\146 ,nbsp:\226\128\162,extends:\194\187,precedes:\194\171", mouse = "a", number = true, numberwidth = 4, shiftround = true, shiftwidth = 0, signcolumn = "yes:1", smartcase = true, tabstop = 2, termguicolors = true, title = true, undofile = true, updatetime = 500, visualbell = true})
vim.g.python3_host_prog = "/usr/local/opt/python/libexec/bin/python"
vim.g.loaded_perl_provider = 0
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
if nvim.fn.executable("rg") then
  util["set-opts"]("o", {grepprg = "rg --vimgrep --no-heading --smart-case", grepformat = "%f:%l:%c:%m"})
else
end
scratch.init()
return _2amodule_2a