-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local cmp = autoload("cmp")
local nfnl = autoload("nfnl.core")
local snippy = autoload("snippy")
local labels = {buffer = "b", cmdline = "q", conjure = "c", snippy = "s", nvim_lsp = "l", path = "p"}
local function menu_label(entry)
  return nfnl.get(labels, nfnl["get-in"](entry, {"source", "name"}), "?")
end
local function format(entry, item)
  return nfnl.update(nfnl.assoc(item, "menu", string.format("[%s]", menu_label(entry))), "kind", string.lower)
end
local function toggle_cmp(_)
  if cmp.visible() then
    return cmp.close()
  else
    return cmp.complete()
  end
end
local function completable_3f()
  return string.match(string.sub(vim.api.nvim_get_current_line(), 1, (vim.api.nvim_win_get_cursor(0))[2]), "[^%s]$")
end
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
local function smart_prev(f)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif snippy.can_jump(-1) then
    return snippy.previous()
  else
    return f()
  end
end
local mapping = {["<C-Space>"] = cmp.mapping(toggle_cmp, {"i", "c"}), ["<C-N>"] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}), {"i", "c"}), ["<C-P>"] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}), {"i", "c"}), ["<CR>"] = cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = false}), {"i", "c"}), ["<C-Y>"] = cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), {"i", "c"}), ["<C-E>"] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}), ["<C-D>"] = cmp.mapping(cmp.mapping.scroll_docs(5), {"i", "c"}), ["<C-U>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), {"i", "c"}), ["<Tab>"] = cmp.mapping(smart_next, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(smart_prev, {"i", "s"})}
local function update_colorscheme()
  vim.api.nvim_set_hl(0, "CmpItemAbbr", {link = "Pmenu"})
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {link = "Pmenu"})
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {link = "Pmenu"})
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {link = "Pmenu"})
  vim.api.nvim_set_hl(0, "CmpItemKind", {link = "Comment"})
  return vim.api.nvim_set_hl(0, "CmpItemMenu", {link = "NonText"})
end
local function config()
  local function _7_(_5_)
    local _arg_6_ = _5_
    local body = _arg_6_["body"]
    return snippy.expand_snippet(body)
  end
  cmp.setup({experimental = {ghost_text = true}, formatting = {fields = {"abbr", "kind", "menu"}, format = format}, mapping = mapping, snippet = {expand = _7_}, sources = {{name = "snippy"}, {name = "buffer"}, {name = "nvim_lsp"}, {name = "conjure"}, {name = "path"}}})
  cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})
  cmp.setup.cmdline(":", {sources = {{name = "cmdline"}, {name = "path"}}})
  do
    local g = vim.api.nvim_create_augroup("config_cmp", {clear = true})
    vim.api.nvim_create_autocmd("ColorScheme", {callback = update_colorscheme, group = g, pattern = "*"})
  end
  return update_colorscheme()
end
return {config = config}
