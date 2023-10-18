-- [nfnl] Compiled from fnl/lsp/clojure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nfnl = autoload("nfnl.core")
local lsp = autoload("lsp.shared")
local lspconfig = autoload("lspconfig")
local ts_utils = autoload("nvim-treesitter.ts_utils")
local util = autoload("lib.util")
local which_key = autoload("which-key")
local function list_at_cursor()
  local n = ts_utils.get_node_at_cursor()
  if (0 == n:named_child_count()) then
    return n:parent()
  else
    return n
  end
end
local function code_action(cmd, line, column)
  return vim.lsp.buf.execute_command({command = cmd, arguments = {vim.uri_from_bufnr(0), line, column}})
end
local function cycle_collection()
  local _3_ = list_at_cursor()
  if (nil ~= _3_) then
    local n = _3_
    local function _6_()
      local _4_, _5_ = n:start()
      return _4_, _5_
    end
    return code_action("cycle-coll", _6_())
  else
    return nil
  end
end
local function cycle_privacy()
  return code_action("cycle-privacy")
end
local function on_attach(client, bufnr)
  which_key.register({xc = {cycle_collection, "Cycle collection"}}, {buffer = bufnr, prefix = "<LocalLeader>"})
  return lsp["on-attach"](client, bufnr)
end
local function setup(opts)
  return lspconfig.clojure_lsp.setup(nfnl.assoc(opts, "on_attach", on_attach))
end
return {["list-at-cursor"] = list_at_cursor, ["code-action"] = code_action, ["cycle-collection"] = cycle_collection, ["cycle-privacy"] = cycle_privacy, ["on-attach"] = on_attach, setup = setup}
