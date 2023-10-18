(local {: autoload} (require :nfnl.module))
(local nfnl (autoload :nfnl.core))
(local str (autoload :nfnl.string))
(local which-key (autoload :which-key))

(local prefix "<LocalLeader>")

(fn init []
  (set vim.g.conjure#eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]})
  (set vim.g.conjure#mapping#doc_word "ed")
  (set vim.g.conjure#eval#mapping#prefix prefix))

(fn register-keymap []
  (which-key.register {:l {:name "log"
                           :e "Open log in current buffer"
                           :g "Toggle log"
                           :l "Jump to last result"
                           :q "Close log"
                           :r "Clear log"
                           :R "Reset log"
                           :s "Open log in horizontal split"
                           :t "Open log in new tab"
                           :v "Open log in vertical split"}
                       :E "Evaluate motion"
                       :e {:name "eval"
                           :! "Replace form with result"
                           :b "Evaluate buffer"
                           :c {:name "comment"
                               :e "Evaluate current form to comment"
                               :r "Evaluate root form to comment"
                               :w "Evaluate word to comment"}
                           :d "Look up documentation"
                           :e "Evaluate current form"
                           :f "Evaluate file from disk"
                           :m "Evaluate form at mark"
                           :r "Evaluate root form"
                           :w "Evaluate word"}
                       :gd "Jump to definition"}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)})
  (which-key.register {:E "Evaluate selection"}
                      {:prefix prefix
                       :mode :v
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn register-keymap-clojure []
  (which-key.register {:c {:name "connection"
                           :d "Disconnect from nREPL server"
                           :f "Connect via nREPL port file"}
                       :ei "Interrupt evaluation"
                       :v {:name "view"
                           :e "View last exception"
                           :1 "View last evaluation result"
                           :2 "View 2nd last evaluation result"
                           :3 "View 3rd last evaluation result"
                           :s "View source"}
                       :s {:name "session"
                           :c "Clone current session"
                           :f "Create fresh session"
                           :l "List sessions"
                           :n "Next session"
                           :p "Previous session"
                           :q "Close current session"
                           :Q "Close all sessions"
                           :s "Select session..."}
                       :t {:name "test"
                           :a "Run all tests"
                           :c "Run test at cursor"
                           :n "Run tests in namespace"
                           :N "Run tests in alternate namespace"}
                       :r {:name "refresh"
                           :a "Refresh all namespaces"
                           :c "Clear namespace refresh cache"
                           :r "Refresh all changed namespaces"}}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn register-keymap-fennel []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}
                       :eF "Reload current file"}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn register-keymap-lisp-janet []
  (which-key.register {:c {:name "connection"
                           :c "Connect to REPL"
                           :d "Disconnect from REPL"}}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn register-keymap-hy-racket []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}
                       :ei "Interrupt evaluation"}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn register-keymap-scheme []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}}
                      {:prefix prefix
                       :buffer (vim.api.nvim_get_current_buf)}))

(fn config []
  (let [g (vim.api.nvim_create_augroup :plugins_conjure_config {:clear true})]
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern (str.join "," (nfnl.get vim.g "conjure#filetypes"))
       :callback register-keymap
       :group g})
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern "clojure" :callback register-keymap-clojure :group g})
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern "fennel" :callback register-keymap-fennel :group g})
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern ["janet" "lisp"] :callback register-keymap-lisp-janet :group g})
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern ["hy" "racket"] :callback register-keymap-hy-racket :group g})
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern "scheme" :callback register-keymap-scheme :group g})
    (vim.api.nvim_create_autocmd
      :BufEnter
      {:pattern "conjure-log-*"
       :callback (fn [{: buf}]
                   (vim.diagnostic.disable buf))
       :group g})))

{1 :Olical/conjure
 : config
 :dependencies [:Olical/nfnl
                :folke/which-key.nvim]
 : init}
