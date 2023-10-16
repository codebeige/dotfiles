local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/sexp.fnl"
local _2amodule_name_2a = "plugins.sexp"
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
local lib, nvim, str, which_key, _ = autoload("lib.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("which-key"), nil
_2amodule_locals_2a["lib"] = lib
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["which-key"] = which_key
_2amodule_locals_2a["_"] = _
local filetypes = {"clojure", "fennel", "scheme", "lisp", "timl"}
_2amodule_2a["filetypes"] = filetypes
local keymaps_n = {["="] = {name = "indent", ["="] = {"<Plug>(sexp_indent)", "indent form"}, ["-"] = {"<Plug>(sexp_indent_top)", "indent root form"}}, ["<"] = {name = "backward", ["("] = {"<Plug>(sexp_capture_prev_element)", "capture previous element"}, [")"] = {"<Plug>(sexp_emit_tail_element)", "emit tail element"}, e = {"<Plug>(sexp_swap_element_backward)", "swap element backward"}, f = {"<Plug>(sexp_swap_list_backward)", "swap form backward"}, I = {"<Plug>(sexp_insert_at_list_head)", "insert at form head"}}, [">"] = {name = "forward", ["("] = {"<Pulg>(sexp_emit_head_element)", "emit head element"}, [")"] = {"<Plug>(sexp_capture_next_element)", "capture next element"}, e = {"<Plug>(sexp_swap_element_forward)", "swap element forward"}, f = {"<Plug>(sexp_swap_list_forward)", "swap form forward"}, I = {"<Plug>(sexp_insert_at_list_tail)", "insert at form tail"}}}
_2amodule_locals_2a["keymaps-n"] = keymaps_n
local keymaps_xo = {a = {name = "around", e = {"<Plug>(sexp_outer_element)", "around element"}, f = {"<Plug>(sexp_outer_list)", "a form"}, F = {"<Plug>(sexp_outer_top_list)", "a root form"}, s = {"a\"", "around string"}}, i = {name = "inside", e = {"<Plug>(sexp_inner_element)", "inner element"}, f = {"<Plug>(sexp_inner_list)", "inner form"}, F = {"<Plug>(sexp_inner_top_list)", "inner root form"}, s = {"i\"", "inner string"}}}
_2amodule_locals_2a["keymaps-xo"] = keymaps_xo
local keymaps_nxo = {["["] = {["["] = {"<Plug>(sexp_move_to_prev_top_element)", "previous root"}}, ["]"] = {["]"] = {"<Plug>(sexp_move_to_next_top_element)", "next root"}}, ["("] = {"<Plug>(sexp_move_to_prev_bracket)", "previous bracket"}, [")"] = {"<Plug>(sexp_move_to_next_bracket)", "next bracket"}, B = {"<Plug>(sexp_move_to_prev_element_head)", "previous element head"}, W = {"<Plug>(sexp_move_to_next_element_head)", "next element head"}, gE = {"<Plug>(sexp_move_to_prev_element_tail)", "previous element tail"}, E = {"<Plug>(sexp_move_to_next_element_tail)", "next element tail"}}
_2amodule_locals_2a["keymaps-nxo"] = keymaps_nxo
local keymaps_leader_n = {x = {name = "transform", d = {"<Plug>(sexp_splice_list)", "splice form"}, o = {name = "raise", e = {"<Plug>(sexp_raise_element)", "raise element"}, f = {"<Plug>(sexp_raise_list)", "raise form"}}, s = {"<Plug>(sexp_convolute)", "convolute surrounding forms"}}}
_2amodule_locals_2a["keymaps-leader-n"] = keymaps_leader_n
local keymaps_leader_nx = {["["] = {["("] = {"<Plug>(sexp_flow_to_prev_open)", "previous opening bracket"}, [")"] = {"<Plug>(sexp_flow_to_prev_close)", "previous closing bracket"}, e = {"<Plug>(sexp_select_prev_element)", "select previous element"}, h = {"<Plug>(sexp_flow_to_prev_leaf_head)", "previous leaf head"}, l = {"<Plug>(sexp_flow_to_prev_leaf_tail)", "previous leaf tail"}}, ["]"] = {["("] = {"<Plug>(sexp_flow_to_next_open)", "next opening bracket"}, [")"] = {"<Plug>(sexp_flow_to_next_close)", "next closing bracket"}, e = {"<Plug>(sexp_select_next_element)", "select next element"}, h = {"<Plug>(sexp_flow_to_next_leaf_head)", "next leaf head"}, l = {"<Plug>(sexp_flow_to_next_leaf_tail)", "next leaf tail"}}, w = {name = "wrap", e = {name = "element", ["("] = {"<Plug>(sexp_round_head_wrap_element)", "wrap element round head"}, [")"] = {"<Plug>(sexp_round_tail_wrap_element)", "wrap element round tail"}, ["["] = {"<Plug>(sexp_square_head_wrap_element)", "wrap element square head"}, ["]"] = {"<Plug>(sexp_square_tail_wrap_element)", "wrap element square tail"}, ["{"] = {"<Plug>(sexp_curly_head_wrap_element)", "wrap element curly head"}, ["}"] = {"<Plug>(sexp_curly_tail_wrap_element)", "wrap element curly tail"}}, f = {name = "form", ["("] = {"<Plug>(sexp_round_head_wrap_list)", "wrap form round head"}, [")"] = {"<Plug>(sexp_round_tail_wrap_list)", "wrap form round tail"}, ["["] = {"<Plug>(sexp_square_head_wrap_list)", "wrap form square head"}, ["]"] = {"<Plug>(sexp_square_tail_wrap_list)", "wrap form square tail"}, ["{"] = {"<Plug>(sexp_curly_head_wrap_list)", "wrap form curly head"}, ["}"] = {"<Plug>(sexp_curly_tail_wrap_list)", "wrap form curly tail"}}}}
_2amodule_locals_2a["keymaps-leader-nx"] = keymaps_leader_nx
local insert_mode_mappings = {["("] = "<Plug>(sexp_insert_opening_round)", ["["] = "<Plug>(sexp_insert_opening_square)", ["{"] = "<Plug>(sexp_insert_opening_curly)", [")"] = "<Plug>(sexp_insert_closing_round)", ["]"] = "<Plug>(sexp_insert_closing_square)", ["}"] = "<Plug>(sexp_insert_closing_curly)", ["\""] = "<Plug>(sexp_insert_double_quote)", ["<BS>"] = "<Plug>(sexp_insert_backspace)"}
_2amodule_locals_2a["insert-mode-mappings"] = insert_mode_mappings
local function register_keymaps(args)
  local bufnr = nvim.get_current_buf()
  for mode, keymap in pairs({n = lib["deep-merge"](keymaps_n, keymaps_nxo), x = lib["deep-merge"](keymaps_xo, keymaps_nxo), o = lib["deep-merge"](keymaps_xo, keymaps_nxo)}) do
    which_key.register(keymap, {buffer = bufnr, mode = mode})
  end
  for mode, keymap in pairs({n = lib["deep-merge"](keymaps_leader_n, keymaps_leader_nx), x = keymaps_leader_nx}) do
    which_key.register(keymap, {buffer = bufnr, mode = mode, prefix = "<LocalLeader>"})
  end
  for lhs, rhs in pairs(insert_mode_mappings) do
    vim.keymap.set("i", lhs, rhs, {buffer = true, remap = true, silent = true})
  end
  return nil
end
_2amodule_2a["register-keymaps"] = register_keymaps
local function setup()
  vim.g.sexp_filetypes = ""
  local nvim_1_auto = require("aniseed.nvim")
  nvim_1_auto.ex.augroup("plugins_sexp")
  nvim_1_auto.ex.autocmd_()
  do
    local nvim_2_auto = require("aniseed.nvim")
    nvim_2_auto.ex.autocmd("FileType", str.join(",", filetypes), ("lua require('" .. _2amodule_name_2a .. "')['" .. "register-keymaps" .. "']()"))
  end
  return nvim_1_auto.ex.augroup("END")
end
_2amodule_2a["setup"] = setup
return _2amodule_2a