(local plugins
  [{:github "codebeige/rig.nvim"
    :build :rig/build}
   {:github "rktjmp/fwatch.nvim"}
   {:github "nvim-lua/plenary.nvim"}
   {:github "tpope/vim-dispatch"}
   {:github "tpope/vim-repeat"}
   {:github "kyazdani42/nvim-web-devicons"}
   {:github "dcampos/nvim-snippy"
    :config :snippy/config}
   {:github "Olical/conjure"
    :init :conjure/init
    :config :conjure/config}
   {:github "dcampos/cmp-snippy"}
   {:github "hrsh7th/cmp-buffer"}
   {:github "hrsh7th/cmp-cmdline"}
   {:github "hrsh7th/cmp-nvim-lsp"}
   {:github "hrsh7th/cmp-path"}
   {:github "nvim-telescope/telescope-ui-select.nvim"}
   {:github "nvim-telescope/telescope-fzf-native.nvim"
    :build :telescope-fzf-native/build}
   {:github "base16-project/base16-vim"
    :config :base16/config}
   {:github "clojure-vim/vim-jack-in"}
   {:github "radenling/vim-dispatch-neovim"}
   {:github "hrsh7th/nvim-cmp"
    :config :cmp/config}
   {:github "folke/which-key.nvim"
    :config :which-key/config}
   {:github "guns/vim-sexp"
    :init :sexp/init
    :config :sexp/config}
   {:github "jaawerth/fennel.vim"}
   {:github "lewis6991/spaceless.nvim"}
   {:github "nvim-lualine/lualine.nvim"
    :config :lualine/config}
   {:github "nvim-mini/mini.ai"
    :config :mini-ai/config}
   {:github "nvim-mini/mini.align"
    :config :mini-align/config}
   {:github "nvim-mini/mini.comment"
    :config :mini-comment/config}
   {:github "nvim-mini/mini.surround"
    :config :mini-surround/config}
   {:github "nvim-telescope/telescope.nvim"
    :config :telescope/config}
   {:github "Olical/nfnl"}
   {:github "romainl/vim-qf"
    :init :qf/init}
   {:github "romus204/tree-sitter-manager.nvim"
    :config :tree-sitter-manager/config}
   {:github "tpope/vim-abolish"}
   {:github "tpope/vim-eunuch"}
   {:github "tpope/vim-fugitive"
    :config :fugitive/config}
   {:github "tpope/vim-projectionist"
    :config :projectionist/config}
   {:github "tpope/vim-unimpaired"
    :config :unimpaired/config}
   {:github "tpope/vim-vinegar"
    :config :vinegar/config}
   {:github "windwp/nvim-autopairs"
    :config :autopairs/config}
   {:github "windwp/nvim-ts-autotag"
    :config :autotag/config}
   {:github "codebeige/canvas.nvim"}])

(fn invoke [s ...]
  (let [(_ _ m k) (string.find s "^(.*)/(.+)$")
        f (. (require (string.format "plugins.%s" m)) k)]
    (f ...)))

(fn register-hooks []
  (let [group (vim.api.nvim_create_augroup :plugins.build {:clear true})]
    (vim.api.nvim_create_autocmd
      :PackChanged
      {:group group
       :callback (fn [ev]
                   (case ev.data.spec.data.build-hook
                     build (invoke build ev.data)))})))

(fn init []
  (each [_ {: init} (ipairs plugins)]
    (when init (invoke init))))

(fn src [{: src : github}]
  (or src (and github (string.format "https://github.com/%s.git" github))))

(fn data [{: data : build}]
  (doto (or data {}) (tset :build-hook build)))

(fn install []
  (vim.pack.add
    (icollect [_ {: name : version &as spec} (ipairs plugins)]
      {:src (src spec) : name : version :data (data spec)})
    {:load true}))

(fn config []
  (each [_ {: config} (ipairs plugins)]
    (when config (invoke config))))

(fn setup []
  (register-hooks)
  (init)
  (install)
  (config))

{: setup}
