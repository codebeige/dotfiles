-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local actions = autoload("telescope.actions")
local telescope = autoload("telescope")
local themes = autoload("telescope.themes")
local which_key = autoload("which-key")
local function init_prompt()
  vim.b.lexima_disabled = true
  return nil
end
local function config()
  do
    local telescope_mappings = {["<C-A>"] = actions.toggle_all, ["<C-H>"] = actions.which_key, ["<C-Q>"] = (actions.smart_send_to_qflist + actions.open_qflist), ["<C-L>"] = actions.close, ["<C-J>"] = actions.cycle_history_next, ["<C-K>"] = actions.cycle_history_prev, ["<M-q>"] = false}
    telescope.setup({defaults = {mappings = {i = telescope_mappings, n = telescope_mappings}}, extensions = {fzf = {case_mode = "smart_case", fuzzy = true, override_file_sorter = true, override_generic_sorter = true}, ["ui-select"] = themes.get_cursor()}})
  end
  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
  which_key.add({{"<Leader>f", group = "find"}, {"<Leader>f<CR>", ":<C-U>Telescope ", desc = "Enter find command...", silent = false}, {"<Leader>f!", "<Cmd>lua require('telescope.builtin').command_history()<CR>", desc = "Command history"}, {"<Leader>f/", "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", desc = "Fuzzy find in buffer..."}, {"<Leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", desc = "Buffers"}, {"<Leader>fc", "<Cmd>lua require('telescope.builtin').colorscheme()<CR>", desc = "Colorschemes"}, {"<Leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Files"}, {"<Leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Search in project"}, {"<Leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "Help"}, {"<Leader>fk", "<Cmd>lua require('telescope.builtin').keymaps()<CR>", desc = "Keymaps"}, {"<Leader>fl", "<Cmd>lua require('telescope.builtin').highlights()<CR>", desc = "Highlights"}, {"<Leader>fo", "<Cmd>lua require('telescope.builtin').oldfiles()<CR>", desc = "File history"}, {"<Leader>fq", "<Cmd>lua require('telescope.builtin').quickfix()<CR>", desc = "Quickfix list"}, {"<Leader>fr", "<Cmd>lua require('telescope.builtin').resume()<CR>", desc = "Resume previous"}, {"<Leader>ft", "<Cmd>Telescope<CR>", desc = "Telescope pickers"}, {"<Leader>f*", "<Cmd>lua require('telescope.builtin').grep_string({word_match = '-w'})<CR>", desc = "Find word"}, {"<Leader>fz", "<Cmd>lua require('telescope.builtin').grep_string({search = '', only_sort_text = true, prompt_title = 'Fuzzy Search'})", desc = "Fuzzy text search"}, {"<Leader>gf", group = "git find"}, {"<Leader>gfb", "<Cmd>lua require('telescope.builtin').git_branches()<CR>", desc = "Branches"}, {"<Leader>gfc", "<Cmd>lua require('telescope.builtin').git_commits()<CR>", desc = "Commits"}, {"<Leader>gff", "<Cmd>lua require('telescope.builtin').git_files()<CR>", desc = "Files"}, {"<Leader>gfh", "<Cmd>lua require('telescope.builtin').git_bcommits()<CR>", desc = "Buffer history"}, {"<Leader>gfi", "<Cmd>lua require('telescope.builtin').git_status()<CR>", desc = "Status"}, {"<Leader>gfs", "<Cmd>lua require('telescope.builtin').git_stash()<CR>", desc = "Stash"}})
  local g = vim.api.nvim_create_augroup("plugins_telescope", {clear = true})
  return vim.api.nvim_create_autocmd("FileType", {callback = init_prompt, group = g, pattern = "TelescopePrompt"})
end
return {"nvim-telescope/telescope.nvim", config = config, dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, version = "*"}
