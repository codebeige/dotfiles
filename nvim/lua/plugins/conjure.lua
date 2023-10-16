local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/conjure.fnl"
local _2amodule_name_2a = "plugins.conjure"
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
local a, nvim, str, util, which_key = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("lib.util"), autoload("which-key")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["which-key"] = which_key
local prefix = "<LocalLeader>"
_2amodule_2a["prefix"] = prefix
local function setup()
  return util["set-opts"]("g:conjure#", {["eval#gsubs"] = {["do-comment"] = {"^%(comment[%s%c]", "(do "}}, ["mapping#doc_word"] = "ed", ["mapping#prefix"] = prefix})
end
_2amodule_2a["setup"] = setup
local function register_keymap()
  which_key.register({l = {name = "log", e = "Open log in current buffer", g = "Toggle log", l = "Jump to last result", q = "Close log", r = "Clear log", R = "Reset log", s = "Open log in horizontal split", t = "Open log in new tab", v = "Open log in vertical split"}, E = "Evaluate motion", e = {name = "eval", ["!"] = "Replace form with result", b = "Evaluate buffer", c = {name = "comment", e = "Evaluate current form to comment", r = "Evaluate root form to comment", w = "Evaluate word to comment"}, d = "Look up documentation", e = "Evaluate current form", f = "Evaluate file from disk", m = "Evaluate form at mark", r = "Evaluate root form", w = "Evaluate word"}, gd = "Jump to definition"}, {prefix = prefix, buffer = nvim.get_current_buf()})
  return which_key.register({E = "Evaluate selection"}, {prefix = prefix, mode = "v", buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap"] = register_keymap
local function register_keymap_clojure()
  return which_key.register({c = {name = "connection", d = "Disconnect from nREPL server", f = "Connect via nREPL port file"}, ei = "Interrupt evaluation", v = {name = "view", e = "View last exception", ["1"] = "View last evaluation result", ["2"] = "View 2nd last evaluation result", ["3"] = "View 3rd last evaluation result", s = "View source"}, s = {name = "session", c = "Clone current session", f = "Create fresh session", l = "List sessions", n = "Next session", p = "Previous session", q = "Close current session", Q = "Close all sessions", s = "Select session..."}, t = {name = "test", a = "Run all tests", c = "Run test at cursor", n = "Run tests in namespace", N = "Run tests in alternate namespace"}, r = {name = "refresh", a = "Refresh all namespaces", c = "Clear namespace refresh cache", r = "Refresh all changed namespaces"}}, {prefix = prefix, buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap-clojure"] = register_keymap_clojure
local function register_keymap_fennel()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}, eF = "Reload current file"}, {prefix = prefix, buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap-fennel"] = register_keymap_fennel
local function register_keymap_lisp_janet()
  return which_key.register({c = {name = "connection", c = "Connect to REPL", d = "Disconnect from REPL"}}, {prefix = prefix, buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap-lisp-janet"] = register_keymap_lisp_janet
local function register_keymap_hy_racket()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}, ei = "Interrupt evaluation"}, {prefix = prefix, buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap-hy-racket"] = register_keymap_hy_racket
local function register_keymap_scheme()
  return which_key.register({c = {name = "connection", s = "Start REPL", S = "Stop REPL"}}, {prefix = prefix, buffer = nvim.get_current_buf()})
end
_2amodule_2a["register-keymap-scheme"] = register_keymap_scheme
local function config()
  local g = vim.api.nvim_create_augroup(_2amodule_name_2a, {clear = true})
  vim.api.nvim_create_autocmd("FileType", {pattern = str.join(",", a.get(vim.g, "conjure#filetypes")), callback = register_keymap, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "clojure", callback = register_keymap_clojure, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "fennel", callback = register_keymap_fennel, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = {"janet", "lisp"}, callback = register_keymap_lisp_janet, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = {"hy", "racket"}, callback = register_keymap_hy_racket, group = g})
  vim.api.nvim_create_autocmd("FileType", {pattern = "scheme", callback = register_keymap_scheme, group = g})
  local function _3_(_1_)
    local _arg_2_ = _1_
    local buf = _arg_2_["buf"]
    return vim.diagnostic.disable(buf)
  end
  return vim.api.nvim_create_autocmd("BufEnter", {pattern = "conjure-log-*", callback = _3_, group = g})
end
_2amodule_2a["config"] = config
return _2amodule_2a