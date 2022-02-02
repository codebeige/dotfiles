(module plugins.unimpaired
  {autoload {which-key which-key}})

(defn config []
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
