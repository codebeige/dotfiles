(fn init []
  (set vim.g.conjure#eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]})
  (set vim.g.conjure#eval#mapping#prefix "<LocalLeader>")
  (set vim.g.conjure#mapping#doc_word false)
  (set vim.g.conjure#completion#omnifunc false)
  (set vim.g.conjure#log#botright true)
  (set vim.g.conjure#log#split#height 0.3)
  (set vim.g.conjure#log#jump_to_latest#enabled true))

(fn config []
  (let [which-key (require :which-key)
        group (vim.api.nvim_create_augroup :plugins.conjure {:clear true})]
    (which-key.add
      [{1 "<LocalLeader>e"  :group "eval"}
       {1 "<LocalLeader>ec" :group "comment"}
       {1 "<LocalLeader>l"  :group "log"}
       {1 "<LocalLeader>c"  :group "connection"}
       {1 "<LocalLeader>g"  :group "goto"}
       {1 "<LocalLeader>r"  :group "repl"}
       {1 "<LocalLeader>t"  :group "test"}])
    (vim.api.nvim_create_autocmd
      :BufEnter
      {:pattern "conjure-log-*"
       :callback (fn [{: buf}]
                   (vim.diagnostic.enable false {:bufnr buf})
                   nil)
       : group})))

{: config : init}
