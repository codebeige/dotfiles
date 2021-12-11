(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure]})

(packer.use {:Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :nvim-treesitter/nvim-treesitter {:config #(require :plugins.treesitter)
                                               :run ":TSUpdate"}
             :neovim/nvim-lspconfig {:config #(require :plugins.lspconfig)}
             :wbthomason/packer.nvim true})
