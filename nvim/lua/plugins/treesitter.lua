-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local treesitter = autoload("nvim-treesitter.configs")
local function config()
  treesitter.setup({ensure_installed = {"bash", "clojure", "comment", "css", "diff", "dockerfile", "dot", "fennel", "git_rebase", "gitattributes", "gitcommit", "gitignore", "graphql", "html", "java", "javascript", "jsdoc", "json", "json5", "jsonc", "lua", "make", "markdown", "markdown_inline", "mermaid", "nix", "org", "python", "query", "regex", "ruby", "scss", "slint", "sql", "typescript", "vim", "yaml"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<LocalLeader>vv", node_decremental = "<LocalLeader>vr", node_incremental = "<LocalLeader>vm", scope_incremental = "<LocalLeader>vM"}}, indent = {enable = true}})
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldenable = false
  return nil
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = true}
