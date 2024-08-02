-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local which_key = autoload("which-key")
local function init()
  vim.g["conjure#eval#gsubs"] = {["do-comment"] = {"^%(comment[%s%c]", "(do "}}
  vim.g["conjure#mapping#doc_word"] = "ed"
  vim.g["conjure#eval#mapping#prefix"] = "<LocalLeader>"
  return nil
end
local function config()
  local g = vim.api.nvim_create_augroup("plugins_conjure_config", {clear = true})
  which_key.add({{"<LocalLeader>e", group = "eval"}, {"<LocalLeader>ec", group = "comment"}, {"<LocalLeader>l", group = "log"}, {"<LocalLeader>c", group = "connection"}, {"<LocalLeader>g", group = "goto"}, {"<LocalLeader>r", group = "repl"}, {"<LocalLeader>t", group = "test"}})
  local function _3_(_2_)
    local buf = _2_["buf"]
    return vim.diagnostic.disable(buf)
  end
  return vim.api.nvim_create_autocmd("BufEnter", {pattern = "conjure-log-*", callback = _3_, group = g})
end
return {"Olical/conjure", config = config, dependencies = {"Olical/nfnl", "folke/which-key.nvim"}, init = init}
