local fn = vim.fn
local ex = vim.api.nvim_command
local kmap = vim.api.nvim_set_keymap

local function prf (s, ...)
  local arg = {...}
  print(string.format(s, unpack(arg)))
end

local function install_dir (repo)
  return string.format('%s/site/pack/packer/start/%s/', fn.stdpath('data'), repo)
end

local function gh_url (user, repo)
  return string.format('https://github.com/%s/%s', user, repo)
end

local pristine_env = false

local function gh_install (user, repo)
  local dir = install_dir(repo)
  if fn.empty(fn.glob(dir)) > 0 then
    prf('Fetching %s/%s from Github …', user, repo)
    fn.system({'git', 'clone', '--depth', '1', gh_url(user, repo), dir})
    ex('packadd ' .. repo)
    ex('helptags ' .. dir .. 'doc')
    pristine_env = true
    prf('Successfully installed %s at %s', repo, dir)
  end
end

local function init ()
  gh_install('wbthomason', 'packer.nvim')
  gh_install('Olical', 'aniseed')
  gh_install('folke', 'which-key.nvim')
  if pristine_env then ex('redraw') end
end

if pcall(init) then
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ','
  vim.g['aniseed#env'] = {
    compile = true,
    module = 'config.init'
  }
else
  print('Error: unable to install. Are you connected to the internet?')
end
