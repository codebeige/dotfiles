(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))

(local ignored-mappings
  ["<s" "<s<Esc>" ">s" ">s<Esc>"])

(fn config []
  (each [_ lhs (ipairs ignored-mappings)]
    (pcall vim.api.nvim_del_keymap :n lhs))
  (which-key.register
    {"[" {:name "previous|above|up|enable"
          "<C-L>" ["<Plug>(unimpaired-lpfile)" "Jump to previous file in location list"]
          "<C-Q>" ["<Plug>(unimpaired-cpfile)" "Previous file in quickfix list"]
          "<C-T>" ["<Plug>(unimpaired-ptprevious)" "Preview previous tag"]
          "<Space>" ["<Plug>(unimpaired-blank-up)" "Add blank line above"]
          :a ["<Plug>(unimpaired-previous)" "Previous file in argument list"]
          :A ["<Plug>(unimpaired-first)" "First file in argument list"]
          :b ["<Plug>(unimpaired-bprevios)" "Previous buffer"]
          :B ["<Plug>(unimpaired-bfirst)" "First buffer"]
          :C ["<Plug>(unimpaired-string-encode)" "Encode string"]
          :e ["<Plug>(unimpaired-move-up)" "Exchange with lines above"]}
     "]" {:name "next|below|down|disable"
          "<C-L>" ["<Plug>(unimpaired-lnfile)" "Jump to next file in location list"]
          "<C-Q>" ["<Plug>(unimpaired-cnfile)" "Next file in quickfix list"]
          "<C-T>" ["<Plug>(unimpaired-ptnext)" "Preview next tag"]
          "<Space>" ["<Plug>(unimpaired-blank-down)" "Add blank line below"]
          :a ["<Plug>(unimpaired-next)" "Next file in argument list"]
          :A ["<Plug>(unimpaired-last)" "Last file in argument list"]
          :b ["<Plug>(unimpaired-bnext)" "Next buffer"]
          :B ["<Plug>(unimpaired-blast)" "Last buffer"]
          :C ["<Plug>(unimpaired-string-decode)" "Decode string"]
          :e ["<Plug>(unimpaired-move-down)" "Exchange with lines below"]}}))

{1 :tpope/vim-unimpaired
 : config}
