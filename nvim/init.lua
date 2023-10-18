local function prf (s, ...)
  local arg = {...}
  print(string.format(s, unpack(arg)))
end

local function install_dir (repo)
  return string.format('%s/site/pack/packer/start/%s/', vim.fn.stdpath('data'), repo)
end

local function gh_url (user, repo)
  return string.format('https://github.com/%s/%s', user, repo)
end

local pristine_env = false

local function gh_install (user, repo)
  local dir = install_dir(repo)
  if vim.fn.empty(vim.fn.glob(dir)) > 0 then
    prf('Fetching %s/%s from Github …', user, repo)
    vim.fn.system({'git', 'clone', '--depth', '1', gh_url(user, repo), dir})
    vim.cmd.packadd(repo)
    vim.cmd.helptags(dir .. 'doc')
    pristine_env = true
    prf('Successfully installed %s at %s', repo, dir)
  end
end

local function init ()
  gh_install('wbthomason', 'packer.nvim')
  if pristine_env then
    vim.cmd.redraw()
  end
end

if pcall(init) then
  require('config')
else
  print('Error: unable to install. Are you connected to the internet?')
end
