(local {: autoload} (require :nfnl.module))
(local fwatch (autoload :fwatch))
(local nfnl (autoload :nfnl.core))
(local str (autoload :nfnl.string))

(local colorscheme-file
  (nfnl.str (os.getenv :HOME) "/.colortheme"))

(fn current []
  (match (nfnl.slurp colorscheme-file true)
    name (-> name str.trim (string.gsub "-256$" ""))
    _ :base16-tomorrow-night-eighties))

(fn update []
  (let [name (current)]
    (when (not= name vim.g.colors_name)
      (vim.cmd.colorscheme name))))

(fn config []
  (update)
  (fwatch.watch colorscheme-file {:on_event (vim.schedule_wrap update)}))

{: update
 : config}
