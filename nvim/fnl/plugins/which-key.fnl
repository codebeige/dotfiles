(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))
(local nfnl (autoload :nfnl.core))

(fn init []
  (set vim.o.timeout true)
  (set vim.o.timeoutlen 500))

(fn config []
  (which-key.setup)

  (which-key.register
    {"[" "previous|above|up|enable"
     "]" "next|below|down|disable"})

  (which-key.register
    {"<CR>" [":" "Enter command..."]
     :b {:name "buffer"
         :q ["<Cmd>confirm quit<CR>`" "Quit window"]
         :Q ["<Cmd>confirm quitall<CR>" "Quit all windows"]
         :r ["<Cmd>checktime %<CR>" "Refresh buffer"]
         :R ["<Cmd>checktime<CR>" "Refresh all buffers"]
         :s [":<C-U>%s/" "Substitute in buffer..."]
         :u ["<Cmd>update<CR>" "Update buffer"]
         :w ["<Cmd>write<CR>" "Write buffer"]
         :W ["<Cmd>wall<CR>" "Write all buffers"]
         :x ["<Cmd>exit<CR>" "Exit buffer"]
         :X ["<Cmd>xqall<CR>" "Exit all buffers"]}
     :c {:name "quickfix list"
         :s [":<C-U>cdo s/" "Substitute each quickfix entry..."]}
    :l {:name "location list"
        :s [":<C-U>ldo s/" "Substitute each location entry..."]}}
    {:prefix "<Leader>"
     :silent false})

  (which-key.register
    {"<CR>" (nfnl.merge [":" "Enter command..."] {:silent false})
     :s (nfnl.merge [":s/" "Substitute in selection..."] {:silent false})}
    {:prefix "<Leader>"
     :mode "x"})

  (which-key.register
    {"<C-L>" ["<Esc>" "Esc"]}
    {:mode "i"}))

{1 :folke/which-key.nvim
 : init
 : config
 :event :VeryLazy}
