(module plugins.telescope
  {autoload {actions telescope.actions
             a aniseed.core
             telescope telescope
             util lib.util}
   require-macros [lib.macros]})

(def- telescope-mappings
  {:<C-A> actions.toggle_all
   :<C-H> actions.which_key
   :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
   :<C-L> actions.close
   :<C-J> actions.cycle_history_next
   :<C-K> actions.cycle_history_prev
   :<M-q> false})

(def- prefix "<Leader>f")

(def- mappings
  {:! "command_history()"
   :/ "current_buffer_fuzzy_find()"
   :b "buffers()"
   :f "find_files()"
   :g "live_grep()"
   :h "help_tags()"
   :k "keymaps()"})

(defn init-prompt []
  (util.set-opts :b {:lexima_disabled true}))

(defn config []
  (telescope.setup
    {:defaults {:mappings {:i telescope-mappings
                           :n telescope-mappings}}
     :extensions {:fzf {:case_mode :smart_case
                        :fuzzy true
                        :override_file_sorter true
                        :override_generic_sorter true}}})

  (telescope.load_extension :fzf)

  (each [k cmd (pairs mappings)]
    (util.map :n
              (.. prefix k)
              (string.format "<Cmd>lua require('telescope.builtin').%s<CR>" cmd)))

  (augroup :plugins_telescope
    (autocmd :FileType "TelescopePrompt" init-prompt)))
