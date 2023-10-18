-- [nfnl] Compiled from fnl/config/clojure.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.clojure_align_subforms = true
vim.g.clojure_fuzzy_indent = true
vim.g.clojure_fuzzy_indent_patterns = {"^with", "^def", "^let", "-as$", "def$", "^reg-", "-loop$", "^for-"}
vim.g.clojure_fuzzy_indent_blacklist = {"-fn$", "\\v^with-%(meta|loading-context)$"}
vim.g.clojure_special_indent_words = {"deftype", "defrecord", "reify", "proxy", "extend-type", "extend-protocol", "letfn"}
local function init_buffer()
  if not vim.b.config_clojure_loaded then
    vim.bo.lispwords = (vim.bo.lispwords .. ",cond,try,async")
    vim.b.config_clojure_loaded = true
    return nil
  else
    return nil
  end
end
local g = vim.api.nvim_create_augroup("config_clojure", {clear = true})
return vim.api.nvim_create_autocmd("FileType", {callback = init_buffer, group = g, pattern = "clojure"})
