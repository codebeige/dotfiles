(module codebeige.scratch)

(defn find-buffer [name]
  (var buffer nil)
  (each [_ b (ipairs (vim.api.nvim_list_bufs)) &until buffer]
    (match (pcall vim.api.nvim_buf_get_var b :scratch_buffer_name)
      (true name) (set buffer b)))
  buffer)

(defn create-buffer [name filetype]
  (doto (vim.api.nvim_create_buf true true)
    (vim.api.nvim_buf_set_name (.. "[" name "]"))
    (vim.api.nvim_buf_set_var :scratch_buffer_name name)
    (vim.api.nvim_buf_set_option :filetype filetype)))

(defn delete-buffer [buffer]
  (vim.api.nvim_buf_delete buffer {:force true}))

(defn new-window [buffer {: count : mods}]
  (vim.cmd.split {: mods})
  (when (< 0 count)
    (if (. mods :vertical)
      (vim.api.nvim_win_set_width 0 count)
      (vim.api.nvim_win_set_height 0 count)))
  (vim.api.nvim_win_set_buf 0 buffer))

(defn close-windows [windows]
  (each [_ w (ipairs windows)]
    (vim.api.nvim_win_close w true)))

(defn toggle-window [name {: count : filetype : mods : purge?}]
  (let [buffer (find-buffer name)
        windows (vim.fn.win_findbuf buffer)]
    (when (and buffer purge?)
      (delete-buffer buffer))
    (if (vim.tbl_isempty windows)
      (let [buffer (or (if (not purge?) buffer)
                       (create-buffer name filetype))]
        (new-window buffer {: count : mods}))
      (when (not purge?)
        (close-windows windows)))))

(defn init []
  (vim.api.nvim_create_user_command
    :Scratch
    (fn [{: bang : count :fargs [name filetype & more] :smods mods}]
      (assert (vim.tbl_isempty more) "Too many arguments for command: Scratch")
      (let [name (or name "scratch")]
        (toggle-window name
                       {: count
                        :filetype (or filetype
                                      (vim.filetype.match {:filename name})
                                      (vim.api.nvim_buf_get_option 0 :filetype)
                                      "text")
                        : mods
                        :purge? bang})))
    {:bang true
     :count 0
     :nargs :*}))

(comment
  (init))
