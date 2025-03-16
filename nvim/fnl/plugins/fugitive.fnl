(fn delete-on-close []
  (set vim.bo.bufhidden :delete))

(fn config []
  (let [which-key (require :which-key)
        group (vim.api.nvim_create_augroup :plugins.fugitive {:clear true})]
    (vim.api.nvim_create_autocmd :BufReadPost {:callback (fn [_]
                                                           (delete-on-close)
                                                           nil)
                                               :pattern "fugitive://*"
                                               : group})

    (which-key.add
      [{1 "<Leader>g" :group "git"}
       {1 "<Leader>g<CR>" 2 ":Git "                                                                                                        :desc "Enter git command..." :silent false}
       {1 "<Leader>gg"    2 "<Cmd>Git<CR>"                                                                                                 :desc "Git status"}
       {1 "<Leader>gb"    2 ":Git blame<CR>"                                                                                               :desc "Git blame" :mode [:n :x]}
       {1 "<Leader>gF"    2 "<Cmd>Git fetch --all --prune --prune-tags --jobs=10 --quiet<CR>"                                              :desc "Git fetch"}
       {1 "<Leader>gl"    2 "<Cmd>Git pull<CR>"                                                                                            :desc "Git pull"}
       {1 "<Leader>gL"    2 "<Cmd>Git fetch --all --prune --prune-tags --jobs=10 --quiet<bar>Git reset --hard HEAD<bar>Git merge @{u}<CR>" :desc "Git pull with reset"}
       {1 "<Leader>gp"    2 "<Cmd>Git push --tags --delete --quiet<CR>"                                                                    :desc "Git push"}
       {1 "<Leader>gP"    2 "<Cmd>Git push --force --tags --delete --quiet<CR>"                                                            :desc "Git push forced"}
       {1 "<Leader>gs"    2 "<Cmd>Git push --tags --delete --quiet --set-upstream origin HEAD<CR>"                                         :desc "Git push upstream"}
       {1 "<Leader>gr"    2 "<Cmd>Gread<CR>"                                                                                               :desc "Read from index"}
       {1 "<Leader>gw"    2 "<Cmd>Gwrite<CR>"                                                                                              :desc "Write to index"}
       {1 "<Leader>g-"    2 "<Cmd>Git add --all<bar>Git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]'<CR>"                :desc "Create WIP commit"}
       {1 "<Leader>gu"    2 "<Cmd>Git reset HEAD~1<CR>"                                                                                    :desc "Undo last commit"}
       {1 "<Leader>gU"    2 "<Cmd>Git reset --hard HEAD~1<CR>"                                                                             :desc "Discard last commit"}])))

{: config}
