(var loaded? false)

(fn update-syntax []
  (let [patterns vim.g.fennel_fuzzy_indent_patterns]
    (table.insert patterns "^with-")
    (table.insert patterns "^doto$")
    (table.insert patterns "^fcollect$")
    (table.insert patterns "^faccumulate$")
    (set vim.g.fennel_fuzzy_indent_patterns patterns)))

(fn init []
  (let [group (vim.api.nvim_create_augroup :config.fennel {:clear true})]
    (vim.api.nvim_create_autocmd :FileType
                                 {:callback update-syntax
                                  :group group
                                  :once true
                                  :pattern "fennel"}))
  (vim.cmd.digraph :fn 955)
  true)

(set loaded? (init))
