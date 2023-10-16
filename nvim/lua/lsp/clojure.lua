local _2afile_2a = "/Users/tc/.config/nvim/fnl/lsp/clojure.fnl"
local _2amodule_name_2a = "lsp.clojure"
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
local a, lsp, lspconfig, ts_utils, util, which_key, _ = autoload("aniseed.core"), autoload("lsp.shared"), autoload("lspconfig"), autoload("nvim-treesitter.ts_utils"), autoload("lib.util"), autoload("which-key"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["lspconfig"] = lspconfig
_2amodule_locals_2a["ts-utils"] = ts_utils
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["which-key"] = which_key
_2amodule_locals_2a["_"] = _
local function list_at_cursor()
  local n = ts_utils.get_node_at_cursor()
  if (0 == n:named_child_count()) then
    return n:parent()
  else
    return n
  end
end
_2amodule_2a["list-at-cursor"] = list_at_cursor
local function code_action(cmd, line, column)
  return vim.lsp.buf.execute_command({command = cmd, arguments = {vim.uri_from_bufnr(), line, column}})
end
_2amodule_2a["code-action"] = code_action
local function cycle_collection()
  local n = list_at_cursor()
  local function _4_()
    local _2_, _3_ = n:start()
    return _2_, _3_
  end
  return code_action("cycle-coll", _4_())
end
_2amodule_2a["cycle-collection"] = cycle_collection
local function cycle_privacy()
  return code_action("cycle-privacy")
end
_2amodule_2a["cycle-privacy"] = cycle_privacy
local function on_attach(client, bufnr)
  which_key.register({xc = a.merge({string.format("<Cmd>%s<CR>", ("lua require('" .. _2amodule_name_2a .. "')['" .. "cycle-collection" .. "']()")), "Cycle collection"})}, {buffer = bufnr, prefix = "<LocalLeader>"})
  return lsp["on-attach"](client, bufnr)
end
_2amodule_2a["on-attach"] = on_attach
local function setup(opts)
  return lspconfig.clojure_lsp.setup(a.assoc(opts, "on_attach", on_attach))
end
_2amodule_2a["setup"] = setup
return _2amodule_2a