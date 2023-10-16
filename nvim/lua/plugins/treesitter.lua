local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/treesitter.fnl"
local _2amodule_name_2a = "plugins.treesitter"
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
local nvim, treesitter, util = autoload("aniseed.nvim"), autoload("nvim-treesitter.configs"), autoload("lib.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["treesitter"] = treesitter
_2amodule_locals_2a["util"] = util
local function config()
  treesitter.setup({ensure_installed = {"bash", "clojure", "comment", "css", "diff", "dockerfile", "dot", "fennel", "git_rebase", "gitattributes", "gitcommit", "gitignore", "graphql", "help", "html", "java", "javascript", "jsdoc", "json", "json5", "jsonc", "lua", "make", "markdown", "markdown_inline", "mermaid", "nix", "org", "python", "query", "regex", "ruby", "scss", "slint", "sql", "typescript", "vim", "yaml"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<LocalLeader>vv", node_decremental = "<LocalLeader>vr", node_incremental = "<LocalLeader>vm", scope_incremental = "<LocalLeader>vM"}}, indent = {enable = true}})
  return util["set-opts"]("o", {foldmethod = "expr", foldexpr = "nvim_treesitter#foldexpr()", foldenable = false})
end
_2amodule_2a["config"] = config
return _2amodule_2a