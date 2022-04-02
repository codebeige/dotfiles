(module plugins.unimpaired
  {autoload {nvim aniseed.nvim
             which-key which-key}})

(def- ignored-mappings
  ["<s" "<s<Esc>" ">s" ">s<Esc>"])

(defn config []
  (each [_ lhs (ipairs ignored-mappings)]
    (pcall nvim.del_keymap :n lhs))
  (which-key.register
    {"[" {"<C-L>" ["<Plug>(unimpaired-lpfile)" "Jump to previous file in location list"]
          "<C-Q>" ["<Plug>(unimpaired-cpfile)" "Previous file in quickfix list"]
          "<C-T>" ["<Plug>(unimpaired-ptprevious)" "Preview previous tag"]
          "<Space>" ["<Plug>(unimpaired-blank-up)" "Add blank line above"]
          :a ["<Plug>(unimpaired-previous)" "Previous file in argument list"]
          :A ["<Plug>(unimpaired-first)" "First file in argument list"]
          :b ["<Plug>(unimpaired-bprevios)" "Previous buffer"]
          :B ["<Plug>(unimpaired-bfirst)" "First buffer"]
          :C ["<Plug>(unimpaired-string-encode)" "Encode string"]
          :e ["<Plug>(unimpaired-move-up)" "Exchange with lines above"]}}))
