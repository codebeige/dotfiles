function fetch(repo, path)
  local url = 'https://github.com/' .. repo .. '.git'
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

local function load_plugin(repo)
  local name = string.match(repo, "/(.*)")
  local dir = vim.fs.joinpath(vim.fn.stdpath('data'), "lazy", name)
  if not vim.loop.fs_stat(dir) then
    fetch(repo, dir)
  end
  vim.opt.rtp:prepend(dir)
  return dir
end

local function load_rig()
  local rig_dev_dir = vim.fs.normalize('~/src/rig.nvim')
  local plugin_dir
  if vim.loop.fs_stat(rig_dev_dir) then
    plugin_dir = rig_dev_dir
  else
    plugin_dir = load_plugin('codebeige/rig.nvim')
  end

  local rig_lua = vim.fs.joinpath(plugin_dir, "lua/rig.lua")
  if not vim.loop.fs_stat(rig_lua) then
    dofile(vim.fs.joinpath(plugin_dir, "build.lua"))
  end
  vim.opt.rtp:prepend(plugin_dir)
  return dir
end

local function init ()
  load_rig()
  local rig = require("rig")
  rig.setup()
  require('config.base').setup()
  rig.exrc()

  load_plugin('folke/lazy.nvim')
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
