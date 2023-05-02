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

(defn new-window [buffer {: count : mods}]
  (vim.cmd.split {: mods})
  (when (< 0 count)
    (if (. mods :vertical)
      (vim.api.nvim_win_set_width 0 count)
      (vim.api.nvim_win_set_height 0 count)))
  (vim.api.nvim_win_set_buf 0 buffer))

(defn toggle-window [buffer {: count : mods}]
  (case (vim.fn.win_findbuf buffer)
    [] (new-window buffer )))


(defn- infer-filetype [name]
  (or (vim.filetype.match {:filename name})
      (vim.api.nvim_buf_get_option 0 :filetype)))

(defn init []
  (vim.api.nvim_create_user_command
    :Scratch
    (fn [{: count :fargs [name filetype & more] :smods mods}]
      (assert (vim.tbl_isempty more) "Too many arguments for command: Scratch")
      (let [name (or name "scratch")
            buffer (or (find-buffer name)
                       (create-buffer name (or filetype
                                               (infer-filetype name)
                                               "text")))]
        (case (vim.fn.win_findbuf buffer)
          [nil] (new-window buffer {: count : mods})
          windows (each [_ w (ipairs windows)]
                    (vim.api.nvim_win_close w true)))))
    {:bang true
     :count 0
     :nargs :*}))

(comment
  (init))

; :Scratch -> toggle [scratch] with current filetype
; :Scratch! -> toggle & wipe buffer
; :Scratch foo -> toggle scratch window with [foo]
; :Scratch foo.clj -> toggle [foo.clj] with filetype clojure
; :belowright 20Scratch -> split with mods
