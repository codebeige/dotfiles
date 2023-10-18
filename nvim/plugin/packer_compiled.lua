-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tc/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?.lua;/Users/tc/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?/init.lua;/Users/tc/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?.lua;/Users/tc/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tc/.cache/nvim/packer_hererocks/2.1.1696795921/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["base16-vim"] = {
    config = { "require('plugins.base16').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/base16-project/base16-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-conjure"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-conjure",
    url = "https://github.com/PaterJason/cmp-conjure"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-snippy"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/cmp-snippy",
    url = "https://github.com/dcampos/cmp-snippy"
  },
  conjure = {
    config = { "require('plugins.conjure').config()" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/conjure",
    url = "https://github.com/Olical/conjure"
  },
  ["easy-align"] = {
    config = { "require('plugins.easy-align').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["fwatch.nvim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/fwatch.nvim",
    url = "https://github.com/rktjmp/fwatch.nvim"
  },
  ["graphviz.vim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/graphviz.vim",
    url = "https://github.com/liuchengxu/graphviz.vim"
  },
  ["lualine.nvim"] = {
    config = { "require('plugins.lualine').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  nfnl = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/nfnl",
    url = "https://github.com/Olical/nfnl"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.autopairs').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-lspconfig" },
    config = { "require('plugins.cmp').config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "require('plugins.lspconfig').config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-snippy"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/nvim-snippy",
    url = "https://github.com/dcampos/nvim-snippy"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-cmp" },
    config = { "require('plugins.treesitter').config()" },
    loaded = true,
    only_config = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "require('plugins.octo').config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "nvim-lspconfig", "octo.nvim" },
    config = { "require('plugins.telescope').config()" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    config = { "require('plugins.fugitive').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jack-in"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/vim-jack-in",
    url = "https://github.com/clojure-vim/vim-jack-in"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sexp"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-surround"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    config = { "require('plugins.unimpaired').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    config = { "require('plugins.which-key').config()" },
    loaded = true,
    path = "/Users/tc/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: conjure
time([[Setup for conjure]], true)
require('plugins.conjure').setup()
time([[Setup for conjure]], false)
time([[packadd for conjure]], true)
vim.cmd [[packadd conjure]]
time([[packadd for conjure]], false)
-- Setup for: vim-sexp
time([[Setup for vim-sexp]], true)
require('plugins.sexp').setup()
time([[Setup for vim-sexp]], false)
time([[packadd for vim-sexp]], true)
vim.cmd [[packadd vim-sexp]]
time([[packadd for vim-sexp]], false)
-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
require('plugins.surround').setup()
time([[Setup for vim-surround]], false)
time([[packadd for vim-surround]], true)
vim.cmd [[packadd vim-surround]]
time([[packadd for vim-surround]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugins.treesitter').config()
time([[Config for nvim-treesitter]], false)
-- Config for: base16-vim
time([[Config for base16-vim]], true)
require('plugins.base16').config()
time([[Config for base16-vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('plugins.lualine').config()
time([[Config for lualine.nvim]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
require('plugins.unimpaired').config()
time([[Config for vim-unimpaired]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
require('plugins.fugitive').config()
time([[Config for vim-fugitive]], false)
-- Config for: conjure
time([[Config for conjure]], true)
require('plugins.conjure').config()
time([[Config for conjure]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('plugins.which-key').config()
time([[Config for which-key.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('plugins.autopairs').config()
time([[Config for nvim-autopairs]], false)
-- Config for: easy-align
time([[Config for easy-align]], true)
require('plugins.easy-align').config()
time([[Config for easy-align]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
require('plugins.cmp').config()

vim.cmd [[ packadd telescope-fzf-native.nvim ]]
vim.cmd [[ packadd telescope-ui-select.nvim ]]
vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
require('plugins.telescope').config()

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
require('plugins.lspconfig').config()

vim.cmd [[ packadd vim-dispatch-neovim ]]
vim.cmd [[ packadd vim-dispatch ]]
vim.cmd [[ packadd vim-jack-in ]]
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd octo.nvim ]]

-- Config for: octo.nvim
require('plugins.octo').config()

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'TSPlaygroundToggle', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSPlaygroundToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSPlaygroundToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TSHighlightCapturesUnderCursor', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSHighlightCapturesUnderCursor', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSHighlightCapturesUnderCursor ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
