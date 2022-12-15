(module plugins.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs
             util lib.util}})

(defn config []
  (treesitter.setup {:ensure_installed :all
                     :highlight {:enable true}
                     :incremental_selection {:enable true
                                             :keymaps {:init_selection "<LocalLeader>vv"
                                                       :node_decremental "<LocalLeader>vr"
                                                       :node_incremental "<LocalLeader>vm"
                                                       :scope_incremental "<LocalLeader>vM"}}
                     :indent {:enable true}})

  (util.set-opts :o {:foldmethod "expr"
                     :foldexpr "nvim_treesitter#foldexpr()"
                     :foldenable false}))
