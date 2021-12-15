(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure]})

(packer.use {:Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :PaterJason/cmp-conjure {:requires :Olical/conjure}
             :hrsh7th/nvim-cmp {:config #(require :plugins.cmp)
                                :requires [:PaterJason/cmp-conjure
                                           :hrsh7th/cmp-buffer
                                           :hrsh7th/cmp-cmdline
                                           :hrsh7th/cmp-nvim-lsp
                                           :hrsh7th/cmp-path]}
             :neovim/nvim-lspconfig {:config #(require :plugins.lspconfig)
                                     :requires [:hrsh7th/nvim-cmp
                                                :nvim-telescope/telescope.nvim]}
             :nvim-telescope/telescope.nvim {:config #(require :plugins.telescope)
                                             :requires [:nvim-lua/plenary.nvim]}
             :nvim-treesitter/nvim-treesitter {:config #(require :plugins.treesitter)
                                               :run ":TSUpdate"}
             :wbthomason/packer.nvim true})
