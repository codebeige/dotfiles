(module config.mappings
  {autoload {which-key which-key}})

(which-key.register
  {"<CR>" [":" "Enter command..."]}
  {:silent false})

(which-key.register
  {:b {:name "buffer"
       :r ["<Cmd>checktime %<CR>" "Refresh buffer"]
       :R ["<Cmd>checktime<CR>" "Refresh all buffers"]
       :w ["<Cmd>write<CR>" "Write buffer"]
       :u ["<Cmd>update<CR>" "Update buffer"]}}
  {:prefix "<Leader>"})

(which-key.register
  {"<C-L>" "Esc"}
  {:mode "i"})
