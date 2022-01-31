(module config.mappings
  {autoload {a aniseed.core
             which-key which-key}})

(which-key.register
  {"<CR>" (a.merge [":" "Enter command..."] {:silent false})
   :b {:name "buffer"
       :q ["<Cmd>confirm quit" "Quit window"]
       :Q ["<Cmd>confirm quitall" "Quit all windows"]
       :r ["<Cmd>checktime %<CR>" "Refresh buffer"]
       :R ["<Cmd>checktime<CR>" "Refresh all buffers"]
       :s (a.merge [":<C-U>%s/" "Substitute in buffer..."] {:silent false})
       :u ["<Cmd>update<CR>" "Update buffer"]
       :w ["<Cmd>write<CR>" "Write buffer"]
       :W ["<Cmd>wall<CR>" "Write all buffers"]
       :x ["<Cmd>exit<CR>" "Exit buffer"]
       :X ["<Cmd>xqall" "Exit all buffers"]}
   :c {:name "quickfix list"
       :s (a.merge [":<C-U>cdo s/" "Substitute each quickfix entry..."] {:silent false})}}
   :l {:name "location list"
       :s (a.merge [":<C-U>ldo s/" "Substitute each location entry..."] {:silent false})}}
  {:prefix "<Leader>"})

(which-key.register
  {"<CR>" (a.merge [":" "Enter command..."] {:silent false})
   :s (a.merge [":s/" "Substitute in selection..."] {:silent false})}
  {:prefix "<Leader>"
   :mode "x"})

(which-key.register
  {"<C-L>" ["<Esc>" "Esc"]}
  {:mode "i"})
