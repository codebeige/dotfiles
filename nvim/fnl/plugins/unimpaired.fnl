(local ignored-mappings
  ["<s"
   "<s<Esc>"
   ">s"
   ">s<Esc>"
   "=s"
   "=s<Esc>"
   "[y"
   "[yy"
   "]y"
   "]yy"
   "]o"
   "]o<Esc>"
   "[o"
   "[o<Esc>"])

(fn config []
  (icollect [_ lhs (ipairs ignored-mappings)]
    (pcall vim.api.nvim_del_keymap :n lhs))

  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "[<C-L>"   :desc "Jump to previous file in location list"}
       {1 "[<C-Q>"   :desc "Previous file in quickfix list"}
       {1 "[<C-T>"   :desc "Preview previous tag"}
       {1 "[<Space>" :desc "Add blank line above"}
       {1 "[A"       :desc "First file in argument list"}
       {1 "[B"       :desc "First buffer"}
       {1 "[L"       :desc "First item in location list"}
       {1 "[Q"       :desc "First item in quickfix list"}
       {1 "[T"       :desc "First matching tag"}
       {1 "[a"       :desc "Previous file in argument list"}
       {1 "[b"       :desc "Previous buffer"}
       {1 "[e"       :desc "Exchange with lines above"}
       {1 "[f"       :desc "Previous file in directory"}
       {1 "[l"       :desc "Previous item in location list"}
       {1 "[n"       :desc "Next conflict marker or diff/patch hunk"}
       {1 "[q"       :desc "Previous item in quickfix list"}
       {1 "[t"       :desc "Previous matching tag"}

       {1 "[C" :group "C-string encode"}
       {1 "[x" :group "XML encode"}
       {1 "[u" :group "URL encode"}

       {1 "[o" :group "enable"}
       {1 "[ob" :desc "Set light background"}
       {1 "[oc" :desc "Enable cursorline"}
       {1 "[od" :desc "Enable diff"}
       {1 "[oh" :desc "Enable search highlighting"}
       {1 "[oi" :desc "Enable ignorecase"}
       {1 "[ol" :desc "Enable listchars"}
       {1 "[on" :desc "Enable line numbers"}
       {1 "[or" :desc "Enable relative line numbers"}
       {1 "[os" :desc "Enable spell checking"}
       {1 "[ot" :desc "Enable colorcolumn"}
       {1 "[ou" :desc "Enable cursorcolumn"}
       {1 "[ov" :desc "Enable virtualedit"}
       {1 "[ow" :desc "Enable wrapping"}
       {1 "[ox" :desc "Enable cursorcolumn and cursorline"}

       {1 "]<C-L>"   :desc "Jump to next file in location list"}
       {1 "]<C-Q>"   :desc "Next file in quickfix list"}
       {1 "]<C-T>"   :desc "Preview next tag"}
       {1 "]<Space>" :desc "Add blank line below"}
       {1 "]A"       :desc "Last file in argument list"}
       {1 "]B"       :desc "Last buffer"}
       {1 "]L"       :desc "Last file in location list"}
       {1 "]Q"       :desc "Last item in quickfix list"}
       {1 "]T"       :desc "Last matching tag"}
       {1 "]a"       :desc "Next file in argument list"}
       {1 "]b"       :desc "Next buffer"}
       {1 "]e"       :desc "Exchange with lines below"}
       {1 "]f"       :desc "Next file in directory"}
       {1 "]l"       :desc "Next file in location list"}
       {1 "]n"       :desc "Previous conflict marker or diff/patch hunk"}
       {1 "]q"       :desc "Next item in quickfix list"}
       {1 "]t"       :desc "Next matching tag"}

       {1 "]C" :group "C-string decode"}
       {1 "]x" :group "XML decode"}
       {1 "]u" :group "URL decode"}

       {1 "]o" :group "disable"}
       {1 "]ob" :desc "Set dark background"}
       {1 "]oc" :desc "Disable cursorline"}
       {1 "]od" :desc "Disable diff"}
       {1 "]oh" :desc "Disable search highlighting"}
       {1 "]oi" :desc "Disable ignorecase"}
       {1 "]ol" :desc "Disable listchars"}
       {1 "]on" :desc "Disable line numbers"}
       {1 "]or" :desc "Disable relative line numbers"}
       {1 "]os" :desc "Disable spell checking"}
       {1 "]ot" :desc "Disable colorcolumn"}
       {1 "]ou" :desc "Disable cursorcolumn"}
       {1 "]ov" :desc "Disable virtualedit"}
       {1 "]ow" :desc "Disable wrapping"}
       {1 "]ox" :desc "Disable cursorcolumn and cursorline"}

       {1 "yo" :group "toggle"}
       {1 "yob" :desc "Toggle background"}
       {1 "yoc" :desc "Toggle cursorline"}
       {1 "yod" :desc "Toggle diff"}
       {1 "yoh" :desc "Toggle search highlighting"}
       {1 "yoi" :desc "Toggle ignorecase"}
       {1 "yol" :desc "Toggle listchars"}
       {1 "yon" :desc "Toggle line numbers"}
       {1 "yor" :desc "Toggle relative line numbers"}
       {1 "yos" :desc "Toggle spell checking"}
       {1 "yot" :desc "Toggle colorcolumn"}
       {1 "you" :desc "Toggle cursorcolumn"}
       {1 "yov" :desc "Toggle virtualedit"}
       {1 "yow" :desc "Toggle wrapping"}
       {1 "yox" :desc "Toggle cursorcolumn and cursorline"}


       {1 "]p" :desc "Put below, preserving indent"}
       {1 "]P" :desc "Put above, preserving indent"}
       {1 "[P" :desc "Put above, preserving indent"}
       {1 "[p" :desc "Put above, preserving indent"}
       {1 ">p" :desc "Put below, increasing indent"}
       {1 ">P" :desc "Put above, increasing indent"}
       {1 "<p" :desc "Put below, decreasing indent"}
       {1 "<P" :desc "Put above, decreasing indent"}
       {1 "=p" :desc "Put below, reindenting"}
       {1 "=P" :desc "Put above, reindenting"}])))

{: config}
