(local {: autoload} (require :nfnl.module))
(local actions (autoload :telescope.actions))
(local nfnl (autoload :nfnl.core))
(local telescope (autoload :telescope))
(local themes (autoload :telescope.themes))
(local which-key (autoload :which-key))

(local telescope-mappings
  {:<C-A> actions.toggle_all
   :<C-H> actions.which_key
   :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
   :<C-L> actions.close
   :<C-J> actions.cycle_history_next
   :<C-K> actions.cycle_history_prev
   :<M-q> false})

(fn map [cmd label opts]
  (nfnl.merge [(string.format "<Cmd>lua require('telescope.builtin').%s<CR>" cmd)
               label]
              opts))

(fn init-prompt []
  (set vim.b.lexima_disabled true))

(fn config []
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
     "<CR>" (nfnl.merge [":<C-U>Telescope " "Enter find command..."] {:silent false})
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

  (let [g (vim.api.nvim_create_augroup :plugins_telescope {:clear true})]
    (vim.api.nvim_create_autocmd :FileType {:callback init-prompt
                                            :group g
                                            :pattern :TelescopePrompt})))

{: config}
