(module plugins.telescope
  {autoload {actions telescope.actions
             a aniseed.core
             telescope telescope
             themes telescope.themes
             util lib.util
             which-key which-key}
   require-macros [lib.macros]})

(def- telescope-mappings
  {:<C-A> actions.toggle_all
   :<C-H> actions.which_key
   :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
   :<C-L> actions.close
   :<C-J> actions.cycle_history_next
   :<C-K> actions.cycle_history_prev
   :<M-q> false})

(defn- map [cmd label opts]
  (a.merge [(string.format "<Cmd>lua require('telescope.builtin').%s<CR>" cmd)
            label]
           opts))

(defn init-prompt []
  (util.set-opts :b {:lexima_disabled true}))

(defn config []
  (telescope.setup
    {:defaults {:mappings {:i telescope-mappings
                           :n telescope-mappings}}
     :extensions {:fzf {:case_mode :smart_case
                        :fuzzy true
                        :override_file_sorter true
                        :override_generic_sorter true}
                  :ui-select (themes.get_cursor)}})

  (telescope.load_extension :fzf)
  (telescope.load_extension :ui-select)

  (which-key.register
    {:name "find"
     "<CR>" (a.merge [":<C-U>Telescope " "Enter find command..."] {:silent false})
     :!     (map "command_history()" "Command history")
     :*     (map "grep_string({word_match = '-w'})" "Find word")
     :/     (map "current_buffer_fuzzy_find()" "Search in buffer")
     :b     (map "buffers()" "Buffers")
     :f     (map "find_files()" "Files")
     :g     (map "live_grep()" "Search in project")
     :h     (map "help_tags()" "Help tags")
     :k     (map "keymaps()" "Keymaps")
     :o     (map "oldfiles()" "Oldfiles")
     :q     (map "quickfix()" "Quickfix List")
     :r     (map "resume()" "Resume previous")
     :t     ["<Cmd>Telescope<CR>" "Telescope pickers"]
     :z     (map "grep_string({search = '', only_sort_text = true, prompt_title = 'Fuzzy Search'})" "Fuzzy text search")}
    {:prefix "<Leader>f"})

  (which-key.register
    {:name "git"
     :f {:name "find"
         :b     (map "git_branches()" "Branches")
         :c     (map "git_commits()" "Commits")
         :f     (map "git_files()" "Git files")
         :h     (map "git_bcommits()" "Buffer history")
         :i     (map "git_status()" "Git status")
         :s     (map "git_stash()" "Git stash")}}
    {:prefix "<Leader>g"})

  (augroup :plugins_telescope
    (autocmd :FileType "TelescopePrompt" init-prompt)))
