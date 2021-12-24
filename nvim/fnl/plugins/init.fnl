(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure]})

(packer.use {:clojure-vim/vim-jack-in {:requires :radenling/vim-dispatch-neovim}
             :Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :PaterJason/cmp-conjure {:requires :Olical/conjure}
             :hrsh7th/nvim-cmp {:config #(require :plugins.cmp)
                                :requires [:PaterJason/cmp-conjure
                                           :hrsh7th/cmp-buffer
                                           :hrsh7th/cmp-cmdline
                                           :hrsh7th/cmp-nvim-lsp
                                           :hrsh7th/cmp-path
                                           :L3MON4D3/LuaSnip
                                           :nvim-treesitter/nvim-treesitter
                                           :saadparwaiz1/cmp_luasnip]}
             :L3MON4D3/LuaSnip {:config #(require :plugins.luasnip)}
             :neovim/nvim-lspconfig {:config #(require :plugins.lspconfig)
                                     :requires [:hrsh7th/nvim-cmp
                                                :nvim-telescope/telescope.nvim]}
             :nvim-telescope/telescope-fzf-native.nvim {:run "make"}
             :nvim-telescope/telescope.nvim {:config #(require :plugins.telescope)
                                             :requires [:nvim-lua/plenary.nvim
                                                        :nvim-telescope/telescope-fzf-native.nvim]}
             :nvim-treesitter/playground {:requires :nvim-treesitter/nvim-treesitter}
             :nvim-treesitter/nvim-treesitter {:config #(require :plugins.treesitter)
                                               :run ":TSUpdate"}
             :radenling/vim-dispatch-neovim {:requires :tpope/vim-dispatch}
             :wbthomason/packer.nvim true})
