(module plugins.conjure
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(def prefix "<LocalLeader>")

(defn register-keymap []
  (which-key.register {:l {:name "log"
                           :s "Open log in horizontal split"
                           :v "Open log in vertical split"
                           :t "Open log in new tab"
                           :e "Open log in current buffer"
                           :q "Close log"
                           :r "Clear log"
                           :R "Reset log"
                           :l "Jump to last result"}}
                        {:prefix prefix
                         :buffer (nvim.get_current_buf)}))

(defn setup []
  (util.set-opts :g:conjure#
                 {:eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}
                  :mapping#doc_word "vd"
                  :mapping#prefix prefix})

  (augroup :plugins_conjure
    (autocmd :FileType (str.join "," (a.get vim.g "conjure#filetypes")) register-keymap)))
