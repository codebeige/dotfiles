(module plugins.telescope
  {autoload {actions telescope.actions
             nvim aniseed.nvim
             telescope telescope
             util lib.util}})

(def mappings
  {"<C-a>" actions.toggle_all
   "<C-h>" actions.which_key
   "<C-q>" (+ actions.smart_send_to_qflist actions.open_qflist)
   "<C-l>" (+ actions.smart_send_to_loclist actions.open_loclist)
   "<M-q>" false})

(telescope.setup
  {:defaults {:mappings {:i mappings :n mappings}}})

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
