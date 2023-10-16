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
    (use :Olical/nfnl)
    (use :wbthomason/packer.nvim)
    (use :folke/which-key.nvim {:config (config :which-key)})
    ; =========================================================================
    (use :nvim-treesitter/nvim-treesitter {:config (config :treesitter)
                                           :run ":TSUpdate"})
    (use :nvim-treesitter/playground {:cmd ["TSHighlightCapturesUnderCursor"
                                            "TSPlaygroundToggle"]})
    (use :neovim/nvim-lspconfig {:after [:nvim-cmp :telescope.nvim]
                                 :config (config :lspconfig)})
    (use :L3MON4D3/LuaSnip)
    (use :hrsh7th/nvim-cmp {:after [:LuaSnip :nvim-treesitter]
                            :config (config :cmp)
                            :requires [:hrsh7th/cmp-buffer
                                       :hrsh7th/cmp-cmdline
                                       :hrsh7th/cmp-nvim-lsp
                                       :hrsh7th/cmp-path
                                       :PaterJason/cmp-conjure
                                       :saadparwaiz1/cmp_luasnip]})
    (use :nvim-telescope/telescope.nvim {:after [:telescope-fzf-native.nvim
                                                 :telescope-ui-select.nvim]
                                         :config (config :telescope)
                                         :requires [:nvim-lua/plenary.nvim]})
    (use :nvim-telescope/telescope-fzf-native.nvim {:run "make"})
    (use :nvim-telescope/telescope-ui-select.nvim)
    (use :nvim-lualine/lualine.nvim {:config (config :lualine)})
    (use :kyazdani42/nvim-web-devicons)
    ; -------------------------------------------------------------------------
    (use :Olical/nvim-local-fennel)
    (use :base16-project/base16-vim {:config (config :base16)
                                     :requires :rktjmp/fwatch.nvim})
    (use :radenling/vim-dispatch-neovim {:requires [:tpope/vim-dispatch]})
    (use :tpope/vim-commentary)
    (use :tpope/vim-eunuch)
    (use :tpope/vim-fugitive {:config (config :fugitive)})
    (use :tpope/vim-surround {:setup (setup :surround)})
    (use :tpope/vim-unimpaired {:config (config :unimpaired)})
    (use :windwp/nvim-autopairs {:config (config :autopairs)})
    ; -------------------------------------------------------------------------
    (use :clojure-vim/vim-jack-in {:after [:vim-dispatch
                                           :vim-dispatch-neovim]})
    (use :guns/vim-sexp {:ft sexp.filetypes
                         :requires [:tpope/vim-repeat]
                         :setup (setup :sexp)})
    (use :Olical/conjure {:config (config :conjure)
                          :setup (setup :conjure)})
    ; -------------------------------------------------------------------------
    (use :junegunn/vim-easy-align {:as :easy-align
                                   :requires [:tpope/vim-repeat]
                                   :config (config :easy-align)})
    (use :liuchengxu/graphviz.vim)
    (use :pwntester/octo.nvim {:after [:nvim-web-devicons
                                       :telescope.nvim]
                               :config (config :octo)})))
