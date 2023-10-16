local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/telescope.fnl"
local _2amodule_name_2a = "plugins.telescope"
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
local a, actions, telescope, themes, util, which_key, _ = autoload("aniseed.core"), autoload("telescope.actions"), autoload("telescope"), autoload("telescope.themes"), autoload("lib.util"), autoload("which-key"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["actions"] = actions
_2amodule_locals_2a["telescope"] = telescope
_2amodule_locals_2a["themes"] = themes
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["which-key"] = which_key
_2amodule_locals_2a["_"] = _
local telescope_mappings = {["<C-A>"] = actions.toggle_all, ["<C-H>"] = actions.which_key, ["<C-Q>"] = (actions.smart_send_to_qflist + actions.open_qflist), ["<C-L>"] = actions.close, ["<C-J>"] = actions.cycle_history_next, ["<C-K>"] = actions.cycle_history_prev, ["<M-q>"] = false}
_2amodule_locals_2a["telescope-mappings"] = telescope_mappings
local function map(cmd, label, opts)
  return a.merge({string.format("<Cmd>lua require('telescope.builtin').%s<CR>", cmd), label}, opts)
end
_2amodule_locals_2a["map"] = map
local function init_prompt()
  return util["set-opts"]("b", {lexima_disabled = true})
end
_2amodule_2a["init-prompt"] = init_prompt
local function config()
  telescope.setup({defaults = {mappings = {i = telescope_mappings, n = telescope_mappings}}, extensions = {fzf = {case_mode = "smart_case", fuzzy = true, override_file_sorter = true, override_generic_sorter = true}, ["ui-select"] = themes.get_cursor()}})
  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
  which_key.register({name = "find", ["<CR>"] = a.merge({":<C-U>Telescope ", "Enter find command..."}, {silent = false}), ["!"] = map("command_history()", "Command history"), ["*"] = map("grep_string({word_match = '-w'})", "Find word"), ["/"] = map("current_buffer_fuzzy_find()", "Search in buffer"), b = map("buffers()", "Buffers"), f = map("find_files()", "Files"), g = map("live_grep()", "Search in project"), h = map("help_tags()", "Help tags"), k = map("keymaps()", "Keymaps"), o = map("oldfiles()", "Oldfiles"), q = map("quickfix()", "Quickfix List"), r = map("resume()", "Resume previous"), t = {"<Cmd>Telescope<CR>", "Telescope pickers"}, z = map("grep_string({search = '', only_sort_text = true, prompt_title = 'Fuzzy Search'})", "Fuzzy text search")}, {prefix = "<Leader>f"})
  which_key.register({name = "git", f = {name = "find", b = map("git_branches()", "Branches"), c = map("git_commits()", "Commits"), f = map("git_files()", "Git files"), h = map("git_bcommits()", "Buffer history"), i = map("git_status()", "Git status"), s = map("git_stash()", "Git stash")}}, {prefix = "<Leader>g"})
  local nvim_1_auto = require("aniseed.nvim")
  nvim_1_auto.ex.augroup("plugins_telescope")
  nvim_1_auto.ex.autocmd_()
  do
    local nvim_2_auto = require("aniseed.nvim")
    nvim_2_auto.ex.autocmd("FileType", "TelescopePrompt", ("lua require('" .. _2amodule_name_2a .. "')['" .. "init-prompt" .. "']()"))
  end
  return nvim_1_auto.ex.augroup("END")
end
_2amodule_2a["config"] = config
return _2amodule_2a