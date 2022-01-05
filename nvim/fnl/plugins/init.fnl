(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer
             sexp plugins.sexp}})

(defn- setup [name]
  (string.format "require('plugins.%s').setup()" name))

(defn- config [name]
  (string.format "require('plugins.%s').config()" name))

(packer.use {; ----------------------------------------------------------------
             :Olical/aniseed true
             :wbthomason/packer.nvim true
             ; ----------------------------------------------------------------
             :clojure-vim/vim-jack-in {:cmd ["Boot" "Clj" "Lein"]
                                       :opt true
                                       :requires :radenling/vim-dispatch-neovim}
             :folke/which-key.nvim {:config (config :which-key)}
             :guns/vim-sexp {:ft sexp.filetypes
                             :requires [:folke/which-key.nvim
                                        :tpope/vim-repeat]
                             :setup (setup :sexp)}
             :hrsh7th/nvim-cmp {:config (config :cmp)
                                :requires [:hrsh7th/cmp-buffer
                                           :hrsh7th/cmp-cmdline
                                           :hrsh7th/cmp-nvim-lsp
                                           :hrsh7th/cmp-path
                                           :L3MON4D3/LuaSnip
                                           :nvim-treesitter/nvim-treesitter
                                           :saadparwaiz1/cmp_luasnip]}
             :L3MON4D3/LuaSnip {:config (config :luasnip)}
             :neovim/nvim-lspconfig {:config (config :lspconfig)
                                     :requires [:hrsh7th/nvim-cmp
                                                :nvim-telescope/telescope.nvim]}
             :nvim-lualine/lualine.nvim {:config (config :lualine)}
             :nvim-telescope/telescope.nvim {:config (config :telescope)
                                             :requires [:nvim-lua/plenary.nvim
                                                        :nvim-telescope/telescope-fzf-native.nvim]}
             :nvim-telescope/telescope-fzf-native.nvim {:run "make"}
             :nvim-treesitter/nvim-treesitter {:config (config :treesitter)
                                               :run ":TSUpdate"}
             :nvim-treesitter/playground {:cmd ["TSHighlightCapturesUnderCursor"
                                                "TSPlaygroundToggle"]
                                          :requires :nvim-treesitter/nvim-treesitter}
             :Olical/conjure {:setup (setup :conjure)}
             :Olical/nvim-local-fennel true
             :PaterJason/cmp-conjure {:requires :Olical/conjure}
             :radenling/vim-dispatch-neovim {:cmd ["Dispatch" "Focus" "Make" "Start"]
                                             :opt true
                                             :requires :tpope/vim-dispatch}
             :tpope/vim-commentary true
             :tpope/vim-repeat {:opt true}
             :tpope/vim-surround {:setup (setup :surround)}})
