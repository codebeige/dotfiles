local _2afile_2a = "/Users/tc/.config/nvim/fnl/plugins/init.fnl"
local _2amodule_name_2a = "plugins.init"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local conjure, packer, sexp = autoload("config.conjure"), autoload("lib.packer"), autoload("plugins.sexp")
do end (_2amodule_locals_2a)["conjure"] = conjure
_2amodule_locals_2a["packer"] = packer
_2amodule_locals_2a["sexp"] = sexp
local function setup(name)
  return string.format("require('plugins.%s').setup()", name)
end
_2amodule_locals_2a["setup"] = setup
local function config(name)
  return string.format("require('plugins.%s').config()", name)
end
_2amodule_locals_2a["config"] = config
local function _1_(use)
  use("Olical/aniseed")
  use("Olical/nfnl")
  use("wbthomason/packer.nvim")
  use("folke/which-key.nvim", {config = config("which-key")})
  use("nvim-treesitter/nvim-treesitter", {config = config("treesitter"), run = ":TSUpdate"})
  use("nvim-treesitter/playground", {cmd = {"TSHighlightCapturesUnderCursor", "TSPlaygroundToggle"}})
  use("neovim/nvim-lspconfig", {after = {"nvim-cmp", "telescope.nvim"}, config = config("lspconfig")})
  use("dcampos/nvim-snippy")
  use("hrsh7th/nvim-cmp", {after = {"nvim-treesitter"}, config = config("cmp"), requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "PaterJason/cmp-conjure", "dcampos/cmp-snippy"}})
  use("nvim-telescope/telescope.nvim", {after = {"telescope-fzf-native.nvim", "telescope-ui-select.nvim"}, config = config("telescope"), requires = {"nvim-lua/plenary.nvim"}})
  use("nvim-telescope/telescope-fzf-native.nvim", {run = "make"})
  use("nvim-telescope/telescope-ui-select.nvim")
  use("nvim-lualine/lualine.nvim", {config = config("lualine")})
  use("kyazdani42/nvim-web-devicons")
  use("Olical/nvim-local-fennel")
  use("base16-project/base16-vim", {config = config("base16"), requires = "rktjmp/fwatch.nvim"})
  use("radenling/vim-dispatch-neovim", {requires = {"tpope/vim-dispatch"}})
  use("tpope/vim-commentary")
  use("tpope/vim-eunuch")
  use("tpope/vim-fugitive", {config = config("fugitive")})
  use("tpope/vim-surround", {setup = setup("surround")})
  use("tpope/vim-unimpaired", {config = config("unimpaired")})
  use("windwp/nvim-autopairs", {config = config("autopairs")})
  use("clojure-vim/vim-jack-in", {after = {"vim-dispatch", "vim-dispatch-neovim"}})
  use("guns/vim-sexp", {ft = sexp.filetypes, requires = {"tpope/vim-repeat"}, setup = setup("sexp")})
  use("Olical/conjure", {config = config("conjure"), setup = setup("conjure")})
  use("junegunn/vim-easy-align", {as = "easy-align", requires = {"tpope/vim-repeat"}, config = config("easy-align")})
  use("liuchengxu/graphviz.vim")
  return use("pwntester/octo.nvim", {after = {"nvim-web-devicons", "telescope.nvim"}, config = config("octo")})
end
packer.startup(_1_)
return _2amodule_2a