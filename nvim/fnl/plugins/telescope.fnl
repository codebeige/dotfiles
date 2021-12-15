(module plugins.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             util lib.util}})

(def- prefix "<Leader>f")

(def- mappings
  {:b "buffers()"
   :f "find_files()"
   :g "live_grep()"
   :h "help_tags()"
   :k "keymaps()"})

(each [k cmd (pairs mappings)]
  (util.map :n
            (.. prefix k)
            (string.format "<Cmd>lua require('telescope.builtin').%s<CR>" cmd)))
