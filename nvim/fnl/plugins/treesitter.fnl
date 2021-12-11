(module plugins.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs
             util lib.util}})

(treesitter.setup {:ensure_installed "maintained"
                   :highlight {:enable true}
                   :indent {:enable true}})

(util.set-opts :o {:foldmethod "expr"
                   :foldexpr "nvim_treesitter#foldexpr()"
                   :foldenable false})
