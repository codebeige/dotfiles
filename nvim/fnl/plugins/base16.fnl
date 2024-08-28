(local colorscheme-file (vim.fs.normalize "~/.colortheme"))

(fn slurp [path]
  (when path
    (match (io.open path "r")
      f (let [content (f:read "*all")]
          (f:close)
          content))))

(fn current []
  (match (slurp colorscheme-file true)
    name (-> name vim.trim (string.gsub "-256$" ""))
    _ :base16-tomorrow-night-eighties))

(fn update []
  (let [name (current)]
    (when (not= name vim.g.colors_name)
      (vim.cmd.colorscheme name))))

(fn config []
  (let [{: watch} (require :fwatch)]
    (update)
    (watch colorscheme-file {:on_event (vim.schedule_wrap update)})))

{: config}
