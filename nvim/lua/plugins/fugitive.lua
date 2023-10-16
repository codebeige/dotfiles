local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/fugitive.fnl"
local _2amodule_name_2a = "plugins.fugitive"
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
local a, str, which_key, _ = autoload("aniseed.core"), autoload("aniseed.string"), autoload("which-key"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["which-key"] = which_key
_2amodule_locals_2a["_"] = _
local function delete_on_close()
  vim.bo.bufhidden = "delete"
  return nil
end
_2amodule_2a["delete-on-close"] = delete_on_close
local function cmd(...)
  return string.format("<Cmd>%s<CR>", str.join("<bar>", {...}))
end
_2amodule_locals_2a["cmd"] = cmd
local fetch_all = "Git fetch --all --prune --prune-tags --jobs=10 --quiet"
_2amodule_2a["fetch-all"] = fetch_all
local push_all = "Git push --tags --delete --quiet"
_2amodule_2a["push-all"] = push_all
local function config()
  do
    local nvim_1_auto = require("aniseed.nvim")
    nvim_1_auto.ex.augroup("plugins_fugitive")
    nvim_1_auto.ex.autocmd_()
    do
      local nvim_2_auto = require("aniseed.nvim")
      nvim_2_auto.ex.autocmd("BufReadPost", "fugitive://*", ("lua require('" .. _2amodule_name_2a .. "')['" .. "delete-on-close" .. "']()"))
    end
    nvim_1_auto.ex.augroup("END")
  end
  return which_key.register({name = "git", ["<CR>"] = a.merge({":Git ", "Enter git command..."}, {silent = false}), g = {cmd("Git"), "Git status"}, b = {":Git blame<CR>", "Git blame"}, F = {cmd(fetch_all), "Git fetch all"}, l = {cmd("Git pull"), "Git pull"}, L = {cmd(fetch_all, "Git reset --hard HEAD", "Git merge @{u}"), "Git pull with reset"}, p = {cmd(push_all), "Git push"}, P = {cmd(str.join(" ", {fetch_all, "--force"})), "Git force push"}, s = {cmd(str.join(" ", {push_all, "--set-upstream", "origin", "HEAD"})), "Git push upstream"}, r = {cmd("Gread"), "Read from index"}, w = {cmd("Gwrite"), "Write to index"}, ["-"] = {cmd("Git add --all", string.format("Git commit --no-verify --no-gpg-sign --message '%s'", "--wip-- [skip ci]")), "Create WIP commit"}, u = {cmd("Git reset HEAD~1"), "Undo last commit"}, U = {cmd("Git reset --hard HEAD~1"), "Discard last commit"}}, {prefix = "<Leader>g"})
end
_2amodule_2a["config"] = config
return _2amodule_2a