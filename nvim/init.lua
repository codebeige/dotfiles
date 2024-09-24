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
  local rig_plugin_dir = "~/src/rig.nvim"
  vim.opt.rtp:prepend(rig_plugin_dir)
  require('rig').setup()

  require('config.base').setup()

  require('lazy').setup('plugins', {
    dev = {
      path = '~/src',
      patterns = { 'codebeige' },
      fallback = false,
    },
    ui = {
      border = require('config.ui').border,
      backdrop = 100,
    },
  })

  require('config').setup()
else
  print('Error: unable to install. Are you connected to the internet?')
end
