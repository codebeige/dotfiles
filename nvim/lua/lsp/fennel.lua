-- [nfnl] Compiled from fnl/lsp/fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("lspconfig")
local fennel_ls = _local_2_["fennel_ls"]
local util = _local_2_["util"]
local dirs = {"", "fnl/", "src/", "src/fnl/", "test/", "test/fnl/"}
local fennel_path
local _3_
do
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, d in ipairs(dirs) do
    local val_19_auto = ("./" .. d .. "?.fnl;./" .. d .. "?/init.fnl")
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  _3_ = tbl_17_auto
end
fennel_path = vim.fn.join(_3_, ";")
local macro_path
local _5_
do
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, d in ipairs(dirs) do
    local val_19_auto = ("./" .. d .. "?.fnl;./" .. d .. "?/init-macros.fnl")
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  _5_ = tbl_17_auto
end
macro_path = vim.fn.join(_5_, ";")
local function setup(opts)
  if (1 == vim.fn.executable("fennel-ls")) then
    return fennel_ls.setup(vim.tbl_deep_extend("force", opts, {settings = {["fennel-ls"] = {["fennel-path"] = (os.getenv("FENNEL_PATH") or fennel_path), ["macro-path"] = (os.getenv("FENNEL_MACRO_PATH") or macro_path)}}}))
  else
    return print("LSP: fennel-ls not found")
  end
end
return {setup = setup}
