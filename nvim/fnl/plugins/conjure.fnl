(module plugins.conjure
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(def prefix "<LocalLeader>")

(defn setup []
  (util.set-opts :g:conjure#
                 {:eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}
                  :mapping#doc_word "ed"
                  :mapping#prefix prefix}))

(defn register-keymap []
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
                       :buffer (nvim.get_current_buf)})
  (which-key.register {:E "Evaluate selection"}
                      {:prefix prefix
                       :mode :v
                       :buffer (nvim.get_current_buf)}))

(defn register-keymap-clojure []
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
                       :buffer (nvim.get_current_buf)}))

(defn register-keymap-fennel []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}
                       :eF "Reload current file"}
                      {:prefix prefix
                       :buffer (nvim.get_current_buf)}))

(defn register-keymap-lisp-janet []
  (which-key.register {:c {:name "connection"
                           :c "Connect to REPL"
                           :d "Disconnect from REPL"}}
                      {:prefix prefix
                       :buffer (nvim.get_current_buf)}))

(defn register-keymap-hy-racket []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}
                       :ei "Interrupt evaluation"}
                      {:prefix prefix
                       :buffer (nvim.get_current_buf)}))

(defn register-keymap-hy-scheme []
  (which-key.register {:c {:name "connection"
                           :s "Start REPL"
                           :S "Stop REPL"}}
                      {:prefix prefix
                       :buffer (nvim.get_current_buf)}))

(defn config []
  (augroup :plugins_conjure_debug
    (autocmd :FileType (str.join "," (a.get vim.g "conjure#filetypes")) register-keymap)
    (autocmd :FileType "clojure" register-keymap-clojure)
    (autocmd :FileType "fennel" register-keymap-fennel)
    (autocmd :FileType "lisp,janet" register-keymap-lisp-janet)
    (autocmd :FileType "hy,racket" register-keymap-hy-racket)
    (autocmd :FileType "scheme" register-keymap-scheme)))
