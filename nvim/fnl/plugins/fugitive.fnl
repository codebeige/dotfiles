(module plugins.fugitive
  {autoload {a aniseed.core
             str aniseed.string
             which-key which-key}
   require-macros [lib.macros]})

(defn delete-on-close []
  (set vim.bo.bufhidden :delete))

(defn- cmd [...]
  (string.format "<Cmd>%s<CR>" (str.join "<bar>" [...])))

(def fetch-all "Git fetch --all --prune --prune-tags --jobs=10 --quiet")
(def push-all "Git push --tags --delete --quiet")

(defn config []
  (augroup :plugins_fugitive
    (autocmd :BufReadPost "fugitive://*" delete-on-close))

  (which-key.register
    {:name "git"
     "<CR>" (a.merge [":Git " "Enter git command..."] {:silent false})
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
     :- [(cmd "Git add --all --update --quiet"
              (string.format
                "Git commit --no-verify --no-gpg-sign --message '%s'"
                "--wip-- [skip ci]"))
         "Create WIP commit"]
     :u [(cmd "Git reset HEAD~1") "Undo last commit"]
     :U [(cmd "Git reset --hard HEAD~1") "Discard last commit"]}
    {:prefix "<Leader>g"}))
