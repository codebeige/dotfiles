(local fuzzy-indent-patterns
 ["^def" "^let" "^while" "^fn$" "^var$" "^case$" "^for$" "^each$" "^local$"
  "^global$" "^match$" "^macro" "^lambda$" "^with-" "^doto$"] )

(fn update-syntax []
  (set vim.g.fennel_fuzzy_indent_patterns fuzzy-indent-patterns)
  (set vim.opt_local.lispwords
       (icollect [_ v (ipairs (vim.opt.lispwords:get))]
         (when (not= v "if") v))))

(fn on-filetype []
  (update-syntax)
  (require :fennel))

(fn setup []
  (let [group (vim.api.nvim_create_augroup :config.fennel {:clear true})]
    (vim.api.nvim_create_autocmd :FileType
                                 {:pattern "fennel"
                                  :callback (fn [_]
                                              (on-filetype)
                                              nil)
                                  :once true
                                  : group}))
  (vim.cmd.digraph :fn 955))

{: setup}
