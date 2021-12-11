(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure
            plugins.treesitter]})

(packer.use {:nvim-treesitter/nvim-treesitter {:run ":TSUpdate"}
             :Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :wbthomason/packer.nvim true})
