(fn $ [s]
  (let [(_ _ m k) (string.find s "^(.*)%.([^.]+)$")]
    (fn [...]
      (let [f (. (require m) k)]
        (f ...)))))

[{1 "base16-project/base16-vim"
  :config ($ :plugins.base16.config)
  :dependencies ["rktjmp/fwatch.nvim"]
  :priority 100}

 {1 "clojure-vim/vim-jack-in"
  :dependencies ["radenling/vim-dispatch-neovim"]}

 "codebeige/rig.nvim"

 {1 "csexton/trailertrash.vim"
  :config ($ :plugins.trailertrash.config)
  :init ($ :plugins.trailertrash.init)}

 "dcampos/nvim-snippy"

 {1 "fatih/vim-go"
  :build "GoInstallBinaries"}

 {1 "hrsh7th/nvim-cmp"
  :config ($ :plugins.cmp.config)
  :dependencies ["Olical/conjure"
                 "PaterJason/cmp-conjure"
                 "dcampos/cmp-snippy"
                 "hrsh7th/cmp-buffer"
                 "hrsh7th/cmp-cmdline"
                 "hrsh7th/cmp-nvim-lsp"
                 "hrsh7th/cmp-path"]}

 {1 "folke/which-key.nvim"
  :config ($ :plugins.which-key.config)}

 {1 "guns/vim-sexp"
  :ft [:clojure :fennel :scheme :lisp :timl]
  :config ($ :plugins.sexp.config)
  :init ($ :plugins.sexp.init)}

 {1 "jaawerth/fennel.vim"
  :ft [:fennel]}

 {1 "junegunn/vim-easy-align"
  :config  ($ :plugins.easy-align.config)
  :dependencies ["tpope/vim-repeat"]}

 "kyazdani42/nvim-web-devicons"

 "lewis6991/spaceless.nvim"

 {1 "neovim/nvim-lspconfig"
  :config ($ :plugins.lspconfig.config)
  :dependencies ["hrsh7th/cmp-nvim-lsp"
                 "nvim-telescope/telescope.nvim"]}

 {1 "nvim-lualine/lualine.nvim"
  :config ($ :plugins.lualine.config)
  :dependencies ["base16-project/base16-vim"]}

 {1 "nvim-telescope/telescope.nvim"
  :config ($ :plugins.telescope.config)
  :dependencies ["nvim-lua/plenary.nvim"
                 "nvim-telescope/telescope-ui-select.nvim"
                 {1 "nvim-telescope/telescope-fzf-native.nvim" :build "make"}]
  :version "*"}

 {1 "nvim-treesitter/nvim-treesitter"
  :build ":TSUpdate"
  :config ($ :plugins.treesitter.config)}

 {1 "nvim-treesitter/playground"
  :cmd ["TSPlaygroundToggle"
        "TSHighlightCapturesUnderCursor"]}

 {1 "Olical/conjure"
  :config ($ :plugins.conjure.config)
  :init ($ :plugins.conjure.init)}

 {1 "Olical/nfnl"
  :ft "fennel"}

 {1 "radenling/vim-dispatch-neovim"
  :dependencies ["tpope/vim-dispatch"]}

 {1 "romainl/vim-qf"
  :init ($ :plugins.qf.init)}

 "tpope/vim-commentary"

 "tpope/vim-eunuch"

 {1 "tpope/vim-fugitive"
  :config ($ :plugins.fugitive.config)}

 {1 "tpope/vim-projectionist"
  :config ($ :plugins.projectionist.config)}

 "tpope/vim-repeat"

 {1 "tpope/vim-surround"
  :init ($ :plugins.surround.init)}

 {1 "tpope/vim-unimpaired"
  :config ($ :plugins.unimpaired.config)}

 {1 "tpope/vim-vinegar"
  :config ($ :plugins.vinegar.config)}

 {1 "windwp/nvim-autopairs"
 :config ($ :plugins.autopairs.config)}]
