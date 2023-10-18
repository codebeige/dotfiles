(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))

(local motion-maps
  {:ga ["<Plug>(EasyAlign)" "align"]
   :gA ["<Plug>(LiveEasyAlign)" "align with preview"]})

(fn config []
  (which-key.register motion-maps)
  (which-key.register motion-maps {:mode :x})
  (which-key.register
    {:name "align"
     :<CR> ["<Cmd>EasyAlign<CR>" "align ..."]
     :p    ["<Cmd>LiveEasyAlign<CR>" "align with preview ..."]}
    {:prefix "<Leader>a"
     :silent false})
  (which-key.register
    {","      ["gaip*," "align on commas"]
     "."      ["gaip." "align on leading dot"]
     :/       ["gaip*<C-R>" "align on regex..."]
     ::       ["gaip*:" "align on colons"]
     :<Space> ["gaip " "align on first space"]
     :=       ["gaip*=" "align on equal signs"]
     :t       ["gaip*|" "align table"]}
    {:noremap false
     :prefix  "<Leader>a"})
  (which-key.register
    {:<CR>    ["<Plug>(EasyAlign)" "align ..."]
     ","      ["ga*," "align on commas"]
     "."      ["ga." "align on leading dot"]
     :/       ["ga*<C-R>" "align on regex..."]
     ::       ["ga*:" "align on colons"]
     :<Space> ["ga " "align on first space"]
     :=       ["ga*=" "align on equal signs"]
     :p       ["<Plug>(LiveEasyAlign)" "align with preview ..."]
     :t       ["ga*|" "align table"]}
    {:mode :x
     :noremap false
     :prefix "<Leader>a"}))

{1 :junegunn/vim-easy-align
 : config
 :dependencies [:tpope/vim-repeat]}
