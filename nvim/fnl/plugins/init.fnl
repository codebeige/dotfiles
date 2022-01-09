(module plugins.init
  {autoload {conjure config.conjure
             packer lib.packer
             sexp plugins.sexp}})

(defn- setup [name]
  (string.format "require('plugins.%s').setup()" name))

(defn- config [name]
  (string.format "require('plugins.%s').config()" name))

(packer.startup
  (fn [use]
    ; =========================================================================
    (use :Olical/aniseed)
    (use :wbthomason/packer.nvim)
    ; =========================================================================
    (use :nvim-treesitter/nvim-treesitter {:config (config :treesitter)
                                           :run ":TSUpdate"})
    (use :nvim-treesitter/playground {:cmd ["TSHighlightCapturesUnderCursor"
                                            "TSPlaygroundToggle"]})
    (use :neovim/nvim-lspconfig {:after [:nvim-cmp :telescope.nvim]
                                 :config (config :lspconfig)})
    (use :L3MON4D3/LuaSnip {:config (config :luasnip)})
    (use :hrsh7th/nvim-cmp {:after [:LuaSnip :nvim-treesitter]
                            :config (config :cmp)
                            :requires [:hrsh7th/cmp-buffer
                                       :hrsh7th/cmp-cmdline
                                       :hrsh7th/cmp-nvim-lsp
                                       :hrsh7th/cmp-path
                                       :PaterJason/cmp-conjure
                                       :saadparwaiz1/cmp_luasnip]})
    (use :nvim-telescope/telescope.nvim {:after :telescope-fzf-native.nvim
                                         :config (config :telescope)
                                         :requires [:nvim-lua/plenary.nvim]})
    (use :nvim-telescope/telescope-fzf-native.nvim {:run "make"})
    (use :nvim-lualine/lualine.nvim {:config (config :lualine)})
    ; -------------------------------------------------------------------------
    (use :tpope/vim-commentary)
    (use :tpope/vim-surround {:setup (setup :surround)})
    (use :tpope/vim-unimpaired)
    (use :Olical/nvim-local-fennel)
    ; -------------------------------------------------------------------------
    (use :guns/vim-sexp {:ft sexp.filetypes
                         :requires [:tpope/vim-repeat]
                         :setup (setup :sexp)})
    (use :Olical/conjure {:setup (setup :conjure)})))
