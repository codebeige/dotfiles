(fn terminal? [buf]
  (= :terminal (. vim.bo buf :buftype)))

(fn clean-up-terminal-buffers [_]
  (each [_ b (ipairs (vim.api.nvim_list_bufs))]
    (if (terminal? b)
      (vim.api.nvim_buf_delete b {:force true}))))

(fn setup []
  (vim.keymap.set :t "<Esc>" "<C-\\><C-n>")
  (vim.keymap.set :t "<C-v><Esc>" "<Esc>")
  (vim.keymap.set :t "<C-w>" "<C-\\><C-n><C-w>")

  (let [group (vim.api.nvim_create_augroup :config.terminal {:clear true})]
    (vim.api.nvim_create_autocmd :ExitPre
                                 {:callback clean-up-terminal-buffers})))

{: setup}
