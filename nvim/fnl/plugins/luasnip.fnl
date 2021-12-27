(module plugins.luasnip
  {autoload {util lib.util}
   require [snippets.all]})

(def- mappings
  {:<C-J> "expand_or_jump()"
   :<C-K> "jump(-1)"})

(defn- cmd->viml [cmd]
  (string.format "<Cmd>lua require('luasnip').%s<CR>" cmd))

(defn setup []
  (each [k cmd (pairs mappings)]
    (util.map :i k (cmd->viml cmd))
    (util.map :s k (cmd->viml cmd))))
