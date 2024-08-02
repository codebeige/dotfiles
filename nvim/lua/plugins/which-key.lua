-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local function config(_, opts)
  which_key.setup(opts)
  return which_key.add({{"[", group = "previous|above|up|enable"}, {"]", group = "next|below|down|disable"}, {"<Leader>b", group = "buffer"}, {"<Leader>bq", "<Cmd>confirm quit<CR>`", desc = "Quit window"}, {"<Leader>bQ", "<Cmd>confirm quitall<CR>", desc = "Quit all windows"}, {"<Leader>br", "<Cmd>checktime %<CR>", desc = "Refresh buffer"}, {"<Leader>bR", "<Cmd>checktime<CR>", desc = "Refresh all buffers"}, {"<Leader>bu", "<Cmd>update<CR>", desc = "Update buffer"}, {"<Leader>bw", "<Cmd>write<CR>", desc = "Write buffer"}, {"<Leader>bW", "<Cmd>wall<CR>", desc = "Write all buffers"}, {"<Leader>bx", "<Cmd>exit<CR>", desc = "Exit buffer"}, {"<Leader>bX", "<Cmd>xqall<CR>", desc = "Exit all buffers"}, {"<Leader><CR>", ":", desc = "Enter command...", mode = {"n", "x"}, silent = false}, {"<Leader>s", group = "substitute"}, {"<Leader>sb", ":<C-U>%s/", desc = "Substitute in buffer...", silent = false}, {"<Leader>sc", ":<C-U>cdo s/", desc = "Substitute each quickfix entry...", silent = false}, {"<Leader>sl", ":<C-U>ldo s/", desc = "Substitute each location entry...", silent = false}, {"<Leader>ss", ":<C-U>s/", desc = "Substitute in current line...", silent = false}, {"<Leader>ss", ":s/", desc = "Substitute in selection...", mode = "x", silent = false}, {"<C-L>", "<Esc>", desc = "Esc", mode = "i"}, {"<Leader>p", "<Cmd>Lazy<CR>", desc = "Open plugin manager..."}})
end
return {"folke/which-key.nvim", config = config, opts = {delay = 200, preset = "modern", icons = {mappings = false}, show_help = false}}
