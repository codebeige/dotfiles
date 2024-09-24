local autopairs     = require("plugins.autopairs")
local base16        = require("plugins.base16")
local cmp           = require("plugins.cmp")
local conjure       = require("plugins.conjure")
local easy_align    = require("plugins.easy-align")
local fugitive      = require("plugins.fugitive")
local lspconfig     = require("plugins.lspconfig")
local lualine       = require("plugins.lualine")
local projectionist = require("plugins.projectionist")
local qf            = require("plugins.qf")
local sexp          = require("plugins.sexp")
local surround      = require("plugins.surround")
local telescope     = require("plugins.telescope")
local trailertrash  = require("plugins.trailertrash")
local treesitter    = require("plugins.treesitter")
local unimpaired    = require("plugins.unimpaired")
local vinegar       = require("plugins.vinegar")
local which_key     = require("plugins.which-key")

return {
  {
    "base16-project/base16-vim",
    config = base16.config,
    dependencies = {"rktjmp/fwatch.nvim"},
    priority = 100,
  },
  {
    "clojure-vim/vim-jack-in",
    dependencies = {"radenling/vim-dispatch-neovim"},
  },
  "codebeige/rig.nvim",
  {
    "csexton/trailertrash.vim",
    config = trailertrash.config,
    init = trailertrash.init,
  },
  "dcampos/nvim-snippy",
  {
    "hrsh7th/nvim-cmp",
    config = cmp.config,
    dependencies = {
      "Olical/conjure",
      "PaterJason/cmp-conjure",
      "dcampos/cmp-snippy",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path"
    },
  },
  {
    "folke/which-key.nvim",
    config = which_key.config,
    opts = which_key.opts,
  },
  {
    "guns/vim-sexp",
    ft = sexp.filetypes,
    init = sexp.init,
    config = sexp.config,
  },
  {
    "jaawerth/fennel.vim",
    ft = "fennel",
  },
  {
    "junegunn/vim-easy-align",
    config = easy_align.config,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  "kyazdani42/nvim-web-devicons",
  "lewis6991/spaceless.nvim",
  {
    "neovim/nvim-lspconfig",
    config = lspconfig.config,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = lualine.config,
    dependencies = {"base16-project/base16-vim"},
  },
  {
    "nvim-telescope/telescope.nvim",
    config = telescope.config,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
    },
    version = "*",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = treesitter.config,
  },
  {
    "nvim-treesitter/playground",
    cmd = {"TSPlaygroundToggle", "TSHighlightCapturesUnderCursor"},
  },
  {
    "Olical/conjure",
    config = conjure.config,
    init = conjure.init,
  },
  {
    "Olical/nfnl",
    ft = "fennel",
  },
  {
    "radenling/vim-dispatch-neovim",
    dependencies = {"tpope/vim-dispatch"},
  },
  {
    "romainl/vim-qf",
    init = qf.init,
  },
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  {
    "tpope/vim-fugitive",
    config = fugitive.config,
  },
  {
    "tpope/vim-projectionist",
    config = projectionist.config,
  },
  "tpope/vim-repeat",
  {
    "tpope/vim-surround",
    init = surround.init,
  },
  {
    "tpope/vim-unimpaired",
    config = unimpaired.config,
  },
  {
    "tpope/vim-vinegar",
    config = vinegar.config,
  },
  {
    "windwp/nvim-autopairs",
    config = autopairs.config,
  },
}
