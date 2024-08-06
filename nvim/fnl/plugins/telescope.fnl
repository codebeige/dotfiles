(local {: autoload} (require :nfnl.module))
(local actions (autoload :telescope.actions))
(local telescope (autoload :telescope))
(local themes (autoload :telescope.themes))
(local which-key (autoload :which-key))

(fn init-prompt []
  (set vim.b.lexima_disabled true))

(fn config []
  (let [telescope-mappings {:<C-A> actions.toggle_all
                            :<C-H> actions.which_key
                            :<C-Q> (+ actions.smart_send_to_qflist actions.open_qflist)
                            :<C-L> actions.close
                            :<C-J> actions.cycle_history_next
                            :<C-K> actions.cycle_history_prev
                            :<M-q> false}]
    (telescope.setup
      {:defaults {:mappings {:i telescope-mappings
                             :n telescope-mappings}}
       :extensions {:fzf {:case_mode :smart_case
                          :fuzzy true
                          :override_file_sorter true
                          :override_generic_sorter true}
                    :ui-select (themes.get_cursor)}}))

  (telescope.load_extension :fzf)
  (telescope.load_extension :ui-select)

  (which-key.add
    [{1 "<Leader>f" :group "find"}
     {1 "<Leader>f<CR>" 2 ":<C-U>Telescope " :desc "Enter find command..." :silent false}

     {1 "<Leader>f!" 2 "<Cmd>lua require('telescope.builtin').command_history()<CR>"           :desc "Command history"}
     {1 "<Leader>f/" 2 "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>" :desc "Fuzzy find in buffer..."}
     {1 "<Leader>fb" 2 "<Cmd>lua require('telescope.builtin').buffers()<CR>"                   :desc "Buffers"}
     {1 "<Leader>fc" 2 "<Cmd>lua require('telescope.builtin').colorscheme()<CR>"               :desc "Colorschemes"}
     {1 "<Leader>ff" 2 "<Cmd>lua require('telescope.builtin').find_files()<CR>"                :desc "Files"}
     {1 "<Leader>fg" 2 "<Cmd>lua require('telescope.builtin').live_grep()<CR>"                 :desc "Search in project"}
     {1 "<Leader>fh" 2 "<Cmd>lua require('telescope.builtin').help_tags()<CR>"                 :desc "Help"}
     {1 "<Leader>fk" 2 "<Cmd>lua require('telescope.builtin').keymaps()<CR>"                   :desc "Keymaps"}
     {1 "<Leader>fl" 2 "<Cmd>lua require('telescope.builtin').highlights()<CR>"                :desc "Highlights"}
     {1 "<Leader>fo" 2 "<Cmd>lua require('telescope.builtin').oldfiles()<CR>"                  :desc "File history"}
     {1 "<Leader>fq" 2 "<Cmd>lua require('telescope.builtin').quickfix()<CR>"                  :desc "Quickfix list"}
     {1 "<Leader>fr" 2 "<Cmd>lua require('telescope.builtin').resume()<CR>"                    :desc "Resume previous"}
     {1 "<Leader>ft" 2 "<Cmd>Telescope<CR>"                                                    :desc "Telescope pickers"}

     {1 "<Leader>f*" 2 "<Cmd>lua require('telescope.builtin').grep_string({word_match = '-w'})<CR>" :desc "Find word"}
     {1 "<Leader>fz" 2 "<Cmd>lua require('telescope.builtin').grep_string({search = '', only_sort_text = true, prompt_title = 'Fuzzy Search'})" :desc "Fuzzy text search"}

     {1 "<Leader>gf" :group "git find"}
     {1 "<Leader>gfb" 2 "<Cmd>lua require('telescope.builtin').git_branches()<CR>" :desc "Branches"}
     {1 "<Leader>gfc" 2 "<Cmd>lua require('telescope.builtin').git_commits()<CR>"  :desc "Commits"}
     {1 "<Leader>gff" 2 "<Cmd>lua require('telescope.builtin').git_files()<CR>"    :desc "Files"}
     {1 "<Leader>gfh" 2 "<Cmd>lua require('telescope.builtin').git_bcommits()<CR>" :desc "Buffer history"}
     {1 "<Leader>gfi" 2 "<Cmd>lua require('telescope.builtin').git_status()<CR>"   :desc "Status"}
     {1 "<Leader>gfs" 2 "<Cmd>lua require('telescope.builtin').git_stash()<CR>"    :desc "Stash"}])

  (let [g (vim.api.nvim_create_augroup :plugins_telescope {:clear true})]
    (vim.api.nvim_create_autocmd :FileType {:callback init-prompt
                                            :group g
                                            :pattern :TelescopePrompt})))

{1 :nvim-telescope/telescope.nvim
 : config
 :dependencies [:nvim-lua/plenary.nvim
                :nvim-telescope/telescope-ui-select.nvim
                {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]
 :version "*"}
