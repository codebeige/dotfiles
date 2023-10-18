(local packer (require :packer))

(fn use [location opts]
  (packer.use (doto (or opts []) (table.insert 1 location))))

(fn setup [name]
  (string.format "require('plugins.%s').setup()" name))

(fn config [name]
  (string.format "require('plugins.%s').config()" name))

(packer.startup
  (fn []
    ; =========================================================================
    (use :wbthomason/packer.nvim)
    (use :Olical/nfnl)
    (use :folke/which-key.nvim {:config (config :which-key)})
    ; =========================================================================
    (use :nvim-treesitter/nvim-treesitter {:config (config :treesitter)
                                           :run ":TSUpdate"})
    (use :nvim-treesitter/playground {:cmd ["TSHighlightCapturesUnderCursor"
                                            "TSPlaygroundToggle"]})
    (use :neovim/nvim-lspconfig {:after [:nvim-cmp :telescope.nvim]
                                 :config (config :lspconfig)})
    (use :dcampos/nvim-snippy)
    (use :hrsh7th/nvim-cmp {:after [:nvim-treesitter]
                            :config (config :cmp)
                            :requires [:hrsh7th/cmp-buffer
                                       :hrsh7th/cmp-cmdline
                                       :hrsh7th/cmp-nvim-lsp
                                       :hrsh7th/cmp-path
                                       :PaterJason/cmp-conjure
                                       :dcampos/cmp-snippy]})
    (use :nvim-telescope/telescope.nvim {:after [:telescope-fzf-native.nvim
                                                 :telescope-ui-select.nvim]
                                         :config (config :telescope)
                                         :requires [:nvim-lua/plenary.nvim]})
    (use :nvim-telescope/telescope-fzf-native.nvim {:run "make"})
    (use :nvim-telescope/telescope-ui-select.nvim)
    (use :nvim-lualine/lualine.nvim {:config (config :lualine)})
    (use :kyazdani42/nvim-web-devicons)
    ; -------------------------------------------------------------------------
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
    (use :guns/vim-sexp {:requires [:tpope/vim-repeat]
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
