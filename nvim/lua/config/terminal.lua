-- [nfnl] Compiled from fnl/config/terminal.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-v><Esc>", "<Esc>")
return vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")
