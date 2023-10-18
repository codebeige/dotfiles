(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local str (autoload :nfnl.string))
(local which-key (autoload :which-key))

(fn delete-on-close []
  (set vim.bo.bufhidden :delete))

(fn cmd [...]
  (string.format "<Cmd>%s<CR>" (str.join "<bar>" [...])))

(local fetch-all "Git fetch --all --prune --prune-tags --jobs=10 --quiet")
(local push-all "Git push --tags --delete --quiet")

(fn config []
  (let [g (vim.api.nvim_create_augroup :plugins_fugitive {:clear true})]
    (vim.api.nvim_create_autocmd :BufReadPost {:callback delete-on-close
                                               :group g
                                               :pattern "fugitive://*"}))

  (which-key.register
    {:name "git"
     "<CR>" (nfnl.merge [":Git " "Enter git command..."] {:silent false})
     :g [(cmd "Git") "Git status"]
     :b [":Git blame<CR>" "Git blame"]
     :F [(cmd fetch-all) "Git fetch all"]
     :l [(cmd "Git pull") "Git pull"]
     :L [(cmd fetch-all "Git reset --hard HEAD" "Git merge @{u}")
         "Git pull with reset"]
     :p [(cmd push-all) "Git push"]
     :P [(cmd (str.join " " [fetch-all "--force"])) "Git force push"]
     :s [(cmd (str.join " " [push-all "--set-upstream" "origin" "HEAD"]))
         "Git push upstream"]
     :r [(cmd "Gread") "Read from index"]
     :w [(cmd "Gwrite") "Write to index"]
     :- [(cmd "Git add --all"
              (string.format
                "Git commit --no-verify --no-gpg-sign --message '%s'"
                "--wip-- [skip ci]"))
         "Create WIP commit"]
     :u [(cmd "Git reset HEAD~1") "Undo last commit"]
     :U [(cmd "Git reset --hard HEAD~1") "Discard last commit"]}
    {:prefix "<Leader>g"}))

{1 :tpope/vim-fugitive
 : config}
