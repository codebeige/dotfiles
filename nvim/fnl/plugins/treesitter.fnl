(module plugins.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs
             util lib.util}})

(treesitter.setup {:ensure_installed "maintained"
                   :highlight {:enable true}
                   :incremental_selection {:enable true
                                           :keymaps {:init_selection "gnn"
                                                     :node_decremental "gnm"
                                                     :node_incremental "gnn"
                                                     :scope_incremental "gns"}}
                   :indent {:enable true}})

(util.set-opts :o {:foldmethod "expr"
                   :foldexpr "nvim_treesitter#foldexpr()"
                   :foldenable false})
