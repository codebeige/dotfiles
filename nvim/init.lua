local function init ()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    print('Fetching folke/lazy.nvim from Github...')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    })
    print('Successfully installed folke/lazy.nvim at', lazypath)
  end
  vim.opt.rtp:prepend(lazypath)
end

if pcall(init) then
  require('config.base')
  require('lazy').setup('plugins', {change_detection = {notify = false}})
  require('config')
else
  print('Error: unable to install. Are you connected to the internet?')
end
