(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer}
   require [plugins.conjure]})

(defn- config [name]
  (string.format "require('plugins.%s').setup()" name))

(def- telescope-deps
  [:nvim-lua/plenary.nvim
   (packer.plugin :nvim-telescope/telescope-fzf-native.nvim {:run "make"})])

(packer.use {; ----------------------------------------------------------------
             :Olical/aniseed true
             :wbthomason/packer.nvim true
             ; ----------------------------------------------------------------
             :clojure-vim/vim-jack-in {:cmd ["Boot" "Clj" "Lein"]
                                       :opt true
                                       :requires :radenling/vim-dispatch-neovim}
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :hrsh7th/nvim-cmp {:config (config :cmp)
                                :requires [(packer.plugin :PaterJason/cmp-conjure
                                                          {:requires :Olical/conjure})
                                           :hrsh7th/cmp-buffer
                                           :hrsh7th/cmp-cmdline
                                           :hrsh7th/cmp-nvim-lsp
                                           :hrsh7th/cmp-path
                                           :L3MON4D3/LuaSnip
                                           :nvim-treesitter/nvim-treesitter
                                           :saadparwaiz1/cmp_luasnip]}
             :L3MON4D3/LuaSnip {:config (config :luasnip)}
             :neovim/nvim-lspconfig {:config (config :lspconfig)
                                     :requires [:hrsh7th/nvim-cmp
                                                (packer.plugin :nvim-telescope/telescope.nvim
                                                               {:requires telescope-deps})]}
             :nvim-lualine/lualine.nvim {:config (config :lualine)}
             :nvim-telescope/telescope.nvim {:config (config :telescope)
                                             :requires telescope-deps}
             :nvim-treesitter/playground {:requires :nvim-treesitter/nvim-treesitter}
             :nvim-treesitter/nvim-treesitter {:config (config :treesitter)
                                               :run ":TSUpdate"}
             :radenling/vim-dispatch-neovim {:cmd ["Dispatch" "Focus" "Make" "Start"]
                                             :opt true
                                             :requires :tpope/vim-dispatch}})
