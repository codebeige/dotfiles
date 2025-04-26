function fetch(repo, path)
  local url = 'https://github.com/' .. repo .. '.git'
  if not vim.loop.fs_stat(path) then
    print('Fetching ' .. url .. '...')
    local result = vim.system(
      {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        url,
        path,
      }, { text = true }
    ):wait()
    if result.code == 0 then
      print('Successfully installed ' .. repo .. ' at ' .. path .. '.')
    else
      error('[' .. result.code .. '] ' .. result.stderr)
    end
  end
end

local function init ()
  local rig_plugin_dir
  local rig_plugin_dev_dir = vim.fs.normalize('~/src/rig.nvim')

  if vim.loop.fs_stat(rig_plugin_dev_dir) then
    rig_plugin_dir = rig_plugin_dev_dir
  else
    rig_plugin_dir = vim.fn.stdpath('data') .. '/lazy/rig.nvim'
    if not vim.loop.fs_stat(rig_plugin_dir) then
      fetch('codebeige/rig.nvim', rig_plugin_dir)
      dofile(rig_plugin_dir .. "/build.lua")
    end
  end
  vim.opt.rtp:prepend(rig_plugin_dir)

  require('rig').setup()
  require('config.base').setup()

  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  fetch('folke/lazy.nvim', lazypath)
  vim.opt.rtp:prepend(lazypath)

  require('lazy').setup({
    spec = require('plugins'),
    dev = {
      path = '~/src',
      patterns = { 'codebeige' },
      fallback = true,
    },
    ui = {
      backdrop = 100,
    },
  })
end

local success, message = pcall(init)

if success then
  require('config').setup()
else
  print('Error: ' .. message)
end
