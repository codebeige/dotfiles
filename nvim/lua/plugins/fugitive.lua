-- [nfnl] Compiled from fnl/plugins/fugitive.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local function delete_on_close()
  vim.bo.bufhidden = "delete"
  return nil
end
local function config()
  do
    local g = vim.api.nvim_create_augroup("plugins_fugitive", {clear = true})
    vim.api.nvim_create_autocmd("BufReadPost", {callback = delete_on_close, group = g, pattern = "fugitive://*"})
  end
  return which_key.add({{"<Leader>g", group = "git"}, {"<Leader>g<CR>", ":Git ", desc = "Enter git command...", silent = false}, {"<Leader>gg", "<Cmd>Git<CR>", desc = "Git status"}, {"<Leader>gb", ":Git blame<CR>", desc = "Git blame", mode = {"n", "x"}}, {"<Leader>gF", "<Cmd>Git fetch --all --prune --prune-tags --jobs=10 --quiet<CR>", desc = "Git fetch"}, {"<Leader>gl", "<Cmd>Git pull<CR>", desc = "Git pull"}, {"<Leader>gL", "<Cmd>Git fetch --all --prune --prune-tags --jobs=10 --quiet<bar>Git reset --hard HEAD<bar>Git merge @{u}<CR>", desc = "Git pull with reset"}, {"<Leader>gp", "<Cmd>Git push --tags --delete --quiet<CR>", desc = "Git push"}, {"<Leader>gP", "<Cmd>Git push --force --tags --delete --quiet<CR>", desc = "Git push forced"}, {"<Leader>gs", "<Cmd>Git push --tags --delete --quiet --set-upstream origin HEAD<CR>", desc = "Git push upstream"}, {"<Leader>gr", "<Cmd>Gread<CR>", desc = "Read from index"}, {"<Leader>gw", "<Cmd>Gwrite<CR>", desc = "Write to index"}, {"<Leader>g-", "<Cmd>Git add --all<bar>Git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]'<CR>", desc = "Create WIP commit"}, {"<Leader>gu", "<Cmd>Git reset HEAD~1<CR>", desc = "Undo last commit"}, {"<Leader>gU", "<Cmd>Git reset --hard HEAD~1<CR>", desc = "Discard last commit"}})
end
return {"tpope/vim-fugitive", config = config}
