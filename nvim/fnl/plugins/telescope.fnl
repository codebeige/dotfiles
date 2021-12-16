(module plugins.telescope
  {autoload {actions telescope.actions
             a aniseed.core
             nvim aniseed.nvim
             telescope telescope
             themes telescope.themes
             util lib.util}
   require-macros [lib.macros]})

(def- mappings
  {:<C-A> actions.toggle_all
   :<C-H> actions.which_key
   :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
   :<M-Q> false})

(def- theme (themes.get_ivy))

(telescope.setup
  {:defaults (a.merge theme
                      {:mappings {:i mappings
                                  :n mappings}})
   :extensions {:fzf {:case_mode :smart_case
                      :fuzzy true
                      :override_file_sorter true
                      :override_generic_sorter true}}})

(telescope.load_extension :fzf)

(def- prefix "<Leader>f")

(def- mappings
  {:! "command_history() "
   :/ "current_buffer_fuzzy_find()"
   :b "buffers()"
   :f "find_files()"
   :g "live_grep()"
   :h "help_tags()"
   :k "keymaps()"})

(each [k cmd (pairs mappings)]
  (util.map :n
            (.. prefix k)
            (string.format "<Cmd>lua require('telescope.builtin').%s<CR>" cmd)))

(defn init-prompt []
  (util.set-opts :b {:lexima_disabled true}))

(augroup :plugins_telescope
  (autocmd :FileType "TelescopePrompt" init-prompt))
