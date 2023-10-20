(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))

(fn init []
 (set vim.g.trailertrash_blacklist ["COMMIT_EDITMSG$" "^conjure-log-*"]))

(fn config []

  (which-key.register {:bt {1 "<Cmd>TrailerTrim<CR>"
                            2 "Trim trailing whitespace"
                            :mode [:n :x]}
                       :t ["<Cmd>Trailer<CR>" "Toggle highlighting of trailing whitespace"]}
                      {:mode [:n]
                       :prefix "<Leader>"}))

{1 :csexton/trailertrash.vim
 : config
 : init}
