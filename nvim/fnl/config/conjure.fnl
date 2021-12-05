(module config.conjure
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(core.merge! nvim.g
             {:conjure#mapping#doc_word "vd"
              :conjure#mapping#prefix "<leader>"})
