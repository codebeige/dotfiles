(fn init []
 (set vim.g.trailertrash_blacklist ["^$" "COMMIT_EDITMSG$" "^conjure-log-*"]))

(fn config []
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "<Leader>bt" 2 "<Cmd>TrailerTrim<CR>" :desc "Trim trailing whitespace"}
       {1 "<Leader>ot" 2 "<Cmd>Trailer<CR>" :desc "Toggle highlighting of trailing whitespace"}])))

{: config
 : init}
