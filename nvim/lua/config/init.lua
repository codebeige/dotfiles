-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local util = autoload("lib.util")
local scratch = autoload("codebeige.scratch")
require("config.diagnostic")
require("config.fennel")
require("config.highlight")
require("config.mappings")
require("plugins.init")
vim.cmd.language("en_US.UTF-8")
util["set-opts"]("o", {colorcolumn = "80", completeopt = "menu,menuone,noselect", cursorline = true, diffopt = ("vertical," .. vim.o.diffopt), expandtab = true, ignorecase = true, inccommand = "split", listchars = "tab:\226\134\146 ,nbsp:\226\128\162,extends:\194\187,precedes:\194\171", mouse = "a", number = true, numberwidth = 4, shiftround = true, shiftwidth = 0, signcolumn = "yes:1", smartcase = true, tabstop = 2, termguicolors = true, title = true, undofile = true, updatetime = 500, visualbell = true})
vim.g.python3_host_prog = "/usr/local/opt/python/libexec/bin/python"
vim.g.loaded_perl_provider = 0
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
if vim.fn.executable("rg") then
  util["set-opts"]("o", {grepprg = "rg --vimgrep --no-heading --smart-case", grepformat = "%f:%l:%c:%m"})
else
end
return scratch.init()
