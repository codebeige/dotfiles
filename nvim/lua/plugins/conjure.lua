-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl = autoload("nfnl.core")
local str = autoload("nfnl.string")
local which_key = autoload("which-key")
local prefix = "<LocalLeader>"
local function init()
  vim.g["conjure#eval#gsubs"] = {["do-comment"] = {"^%(comment[%s%c]", "(do "}}
  vim.g["conjure#mapping#doc_word"] = "ed"
  vim.g["conjure#eval#mapping#prefix"] = prefix
  return nil
end
local function register_keymap()
  which_key.register({l = {name = "log", e = "Open log in current buffer", g = "Toggle log", l = "Jump to last result", q = "Close log", r = "Clear log", R = "Reset log", s = "Open log in horizontal split", t = "Open log in new tab", v = "Open log in vertical split"}, E = "Evaluate motion", e = {name = "eval", ["!"] = "Replace form with result", b = "Evaluate buffer", c = {name = "comment", e = "Evaluate current form to comment", r = "Evaluate root form to comment", w = "Evaluate word to comment"}, d = "Look up documentation", e = "Evaluate current form", f = "Evaluate file from disk", m = "Evaluate form at mark", r = "Evaluate root form", w = "Evaluate word"}, gd = "Jump to definition"}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
  return which_key.register({E = "Evaluate selection"}, {prefix = prefix, mode = "v", buffer = vim.api.nvim_get_current_buf()})
end
local function register_keymap_clojure()
  return which_key.register({c = {name = "connection", d = "Disconnect from nREPL server", f = "Connect via nREPL port file"}, ei = "Interrupt evaluation", v = {name = "view", e = "View last exception", ["1"] = "View last evaluation result", ["2"] = "View 2nd last evaluation result", ["3"] = "View 3rd last evaluation result", s = "View source"}, s = {name = "session", c = "Clone current session", f = "Create fresh session", l = "List sessions", n = "Next session", p = "Previous session", q = "Close current session", Q = "Close all sessions", s = "Select session..."}, t = {name = "test", a = "Run all tests", c = "Run test at cursor", n = "Run tests in namespace", N = "Run tests in alternate namespace"}, r = {name = "refresh", a = "Refresh all namespaces", c = "Clear namespace refresh cache", r = "Refresh all changed namespaces"}}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
end
local function register_keymap_fennel()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}, eF = "Reload current file"}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
end
local function register_keymap_lisp_janet()
  return which_key.register({c = {name = "connection", c = "Connect to REPL", d = "Disconnect from REPL"}}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
end
local function register_keymap_hy_racket()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}, ei = "Interrupt evaluation"}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
end
local function register_keymap_scheme()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}}, {prefix = prefix, buffer = vim.api.nvim_get_current_buf()})
end
local function config()
  local g = vim.api.nvim_create_augroup("plugins_conjure_config", {clear = true})
  vim.api.nvim_create_autocmd("FileType", {pattern = str.join(",", nfnl.get(vim.g, "conjure#filetypes")), callback = register_keymap, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "clojure", callback = register_keymap_clojure, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "fennel", callback = register_keymap_fennel, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = {"janet", "lisp"}, callback = register_keymap_lisp_janet, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = {"hy", "racket"}, callback = register_keymap_hy_racket, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "scheme", callback = register_keymap_scheme, group = g})
  local function _4_(_2_)
    local _arg_3_ = _2_
    local buf = _arg_3_["buf"]
    return vim.diagnostic.disable(buf)
  end
  return vim.api.nvim_create_autocmd("BufEnter", {pattern = "conjure-log-*", callback = _4_, group = g})
end
return {"Olical/conjure", config = config, dependencies = {"Olical/nfnl", "folke/which-key.nvim"}, init = init}
