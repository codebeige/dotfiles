local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/cmp.fnl"
local _2amodule_name_2a = "plugins.cmp"
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
local a, cmp, nvim, snippy, _ = autoload("aniseed.core"), autoload("cmp"), autoload("aniseed.nvim"), autoload("snippy"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["cmp"] = cmp
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["snippy"] = snippy
_2amodule_locals_2a["_"] = _
local labels = {buffer = "b", cmdline = "q", conjure = "c", snippy = "s", nvim_lsp = "l", path = "p"}
_2amodule_locals_2a["labels"] = labels
local function menu_label(entry)
  return a.get(labels, a["get-in"](entry, {"source", "name"}), "?")
end
_2amodule_locals_2a["menu-label"] = menu_label
local function format(entry, item)
  return a.update(a.assoc(item, "menu", string.format("[%s]", menu_label(entry))), "kind", string.lower)
end
_2amodule_locals_2a["format"] = format
local function toggle_cmp(_0)
  if cmp.visible() then
    return cmp.close()
  else
    return cmp.complete()
  end
end
_2amodule_2a["toggle-cmp"] = toggle_cmp
local function completable_3f()
  return string.match(string.sub(vim.api.nvim_get_current_line(), 1, (vim.api.nvim_win_get_cursor(0))[2]), "[^%s]$")
end
_2amodule_locals_2a["completable?"] = completable_3f
local function smart_next(f)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif snippy.can_expand_or_advance() then
    return snippy.expand_or_advance()
  elseif completable_3f() then
    return cmp.complete()
  else
    return f()
  end
end
_2amodule_2a["smart-next"] = smart_next
local function smart_prev(f)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif snippy.can_jump(-1) then
    return snippy.previous()
  else
    return f()
  end
end
_2amodule_2a["smart-prev"] = smart_prev
local mapping = {["<C-Space>"] = cmp.mapping(toggle_cmp, {"i", "c"}), ["<C-N>"] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}), {"i", "c"}), ["<C-P>"] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}), {"i", "c"}), ["<CR>"] = cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = false}), {"i", "c"}), ["<C-Y>"] = cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), {"i", "c"}), ["<C-E>"] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}), ["<C-D>"] = cmp.mapping(cmp.mapping.scroll_docs(5), {"i", "c"}), ["<C-U>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), {"i", "c"}), ["<Tab>"] = cmp.mapping(smart_next, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(smart_prev, {"i", "s"})}
_2amodule_locals_2a["mapping"] = mapping
local function update_colorscheme()
  nvim.ex["highlight!"]("link", "CmpItemAbbr", "Pmenu")
  nvim.ex["highlight!"]("link", "CmpItemAbbrDeprecated", "Pmenu")
  nvim.ex["highlight!"]("link", "CmpItemAbbrMatch", "Pmenu")
  nvim.ex["highlight!"]("link", "CmpItemAbbrMatchFuzzy", "Pmenu")
  nvim.ex["highlight!"]("link", "CmpItemKind", "Comment")
  return nvim.ex["highlight!"]("link", "CmpItemMenu", "NonText")
end
_2amodule_2a["update-colorscheme"] = update_colorscheme
local function config()
  local function _6_(_4_)
    local _arg_5_ = _4_
    local body = _arg_5_["body"]
    return snippy.expand_snippet(body)
  end
  cmp.setup({experimental = {ghost_text = true}, formatting = {fields = {"abbr", "kind", "menu"}, format = format}, mapping = mapping, snippet = {expand = _6_}, sources = {{name = "snippy"}, {name = "buffer"}, {name = "nvim_lsp"}, {name = "conjure"}, {name = "path"}}})
  cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})
  cmp.setup.cmdline(":", {sources = {{name = "cmdline"}, {name = "path"}}})
  update_colorscheme()
  local nvim_1_auto = require("aniseed.nvim")
  nvim_1_auto.ex.augroup("config_cmp")
  nvim_1_auto.ex.autocmd_()
  do
    local nvim_2_auto = require("aniseed.nvim")
    nvim_2_auto.ex.autocmd("ColorScheme", "*", ("lua require('" .. _2amodule_name_2a .. "')['" .. "update-colorscheme" .. "']()"))
  end
  return nvim_1_auto.ex.augroup("END")
end
_2amodule_2a["config"] = config
return _2amodule_2a