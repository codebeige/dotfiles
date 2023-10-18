-- [nfnl] Compiled from fnl/plugins/fugitive.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl = autoload("nfnl.core")
local str = autoload("nfnl.string")
local which_key = autoload("which-key")
local function delete_on_close()
  vim.bo.bufhidden = "delete"
  return nil
end
local function cmd(...)
  return string.format("<Cmd>%s<CR>", str.join("<bar>", {...}))
end
local fetch_all = "Git fetch --all --prune --prune-tags --jobs=10 --quiet"
local push_all = "Git push --tags --delete --quiet"
local function config()
  do
    local g = vim.api.nvim_create_augroup("plugins_fugitive", {clear = true})
    vim.api.nvim_create_autocmd("BufReadPost", {callback = delete_on_close, group = g, pattern = "fugitive://*"})
  end
  return which_key.register({name = "git", ["<CR>"] = nfnl.merge({":Git ", "Enter git command..."}, {silent = false}), g = {cmd("Git"), "Git status"}, b = {":Git blame<CR>", "Git blame"}, F = {cmd(fetch_all), "Git fetch all"}, l = {cmd("Git pull"), "Git pull"}, L = {cmd(fetch_all, "Git reset --hard HEAD", "Git merge @{u}"), "Git pull with reset"}, p = {cmd(push_all), "Git push"}, P = {cmd(str.join(" ", {fetch_all, "--force"})), "Git force push"}, s = {cmd(str.join(" ", {push_all, "--set-upstream", "origin", "HEAD"})), "Git push upstream"}, r = {cmd("Gread"), "Read from index"}, w = {cmd("Gwrite"), "Write to index"}, ["-"] = {cmd("Git add --all", string.format("Git commit --no-verify --no-gpg-sign --message '%s'", "--wip-- [skip ci]")), "Create WIP commit"}, u = {cmd("Git reset HEAD~1"), "Undo last commit"}, U = {cmd("Git reset --hard HEAD~1"), "Discard last commit"}}, {prefix = "<Leader>g"})
end
return {"tpope/vim-fugitive", config = config}
