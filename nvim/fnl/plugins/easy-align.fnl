(fn config [_ _]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "ga" 2 "<Plug>(EasyAlign)"     :desc "align"                :mode [:n :x]}
       {1 "gA" 2 "<Plug>(LiveEasyAlign)" :desc "align (live preview)" :mode [:n :x]}

       {1 "<Leader>a" :group "align"}

       {1 "<Leader>a,"       2 "gaip*,"     :desc "align on commas"      :noremap false}
       {1 "<Leader>a."       2 "gaip."      :desc "align on leading dot" :noremap false}
       {1 "<Leader>a/"       2 "gaip*<C-X>" :desc "align on regex..."    :noremap false}
       {1 "<Leader>a:"       2 "gaip*:"     :desc "align on colons"      :noremap false}
       {1 "<Leader>a<Space>" 2 "gaip "      :desc "align on first space" :noremap false}
       {1 "<Leader>a="       2 "gaip*="     :desc "align on equal signs" :noremap false}
       {1 "<Leader>at"       2 "gaip*|"     :desc "align table"          :noremap false}

       {1 "<Leader>a<CR>" 2 "<Plug>(EasyAlign)"     :desc "align table"          :noremap false :mode :x}
       {1 "<Leader>ap"    2 "<Plug>(LiveEasyAlign)" :desc "align (live preview)" :noremap false :mode :x}

       {1 "<Leader>a,"       2 "ga*,"     :desc "align on commas"      :noremap false :mode :x}
       {1 "<Leader>a."       2 "ga*,"     :desc "align on leading dot" :noremap false :mode :x}
       {1 "<Leader>a/"       2 "ga*<C-X>" :desc "align on regex..."    :noremap false :mode :x}
       {1 "<Leader>a:"       2 "ga*:"     :desc "align on colons"      :noremap false :mode :x}
       {1 "<Leader>a<Space>" 2 "ga "      :desc "align on first space" :noremap false :mode :x}
       {1 "<Leader>a="       2 "ga*="     :desc "align on equal signs" :noremap false :mode :x}
       {1 "<Leader>at"       2 "ga*|"     :desc "align table"          :noremap false :mode :x}])))

{: config}
