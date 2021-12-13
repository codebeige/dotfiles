(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure]})

(packer.use {:Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :hrsh7th/nvim-cmp {:config #(require :plugins.cmp)
                                :requires [:PaterJason/cmp-conjure
                                           :hrsh7th/cmp-buffer
                                           :hrsh7th/cmp-nvim-lsp]}
             :neovim/nvim-lspconfig {:config #(require :plugins.lspconfig)
                                     :requires [:hrsh7th/nvim-cmp]}
             :nvim-treesitter/nvim-treesitter {:config #(require :plugins.treesitter)
                                               :run ":TSUpdate"}
             :wbthomason/packer.nvim true})
