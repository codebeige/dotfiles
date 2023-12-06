-- [nfnl] Compiled from fnl/config/base.fnl by https://github.com/Olical/nfnl, do not edit.
vim.cmd.language("en_US.UTF-8")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.clipboard = "unnamed"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.cursorline = true
vim.o.diffopt = ("vertical," .. vim.o.diffopt)
vim.o.expandtab = true
vim.o.exrc = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.listchars = "tab:\226\134\146 ,nbsp:\226\128\162,extends:\194\187,precedes:\194\171"
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 4
vim.o.shiftround = true
vim.o.shiftwidth = 0
vim.o.signcolumn = "yes:1"
vim.o.smartcase = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.title = true
vim.o.undofile = true
vim.o.updatetime = 500
vim.o.visualbell = true
vim.g.python3_host_prog = "/usr/local/opt/python/libexec/bin/python"
vim.g.loaded_perl_provider = 0
if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.o.grepformat = "%f:%l:%c:%m"
  return nil
else
  return nil
end
