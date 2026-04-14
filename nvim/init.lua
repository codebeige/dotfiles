local function fetch(repo, path)
  local url = 'https://github.com/' .. repo .. '.git'
  print('Fetching ' .. url .. '...')
  local result = vim.system(
    {
      'git',
      'clone',
      '--filter=blob:none',
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

local function load_rig()
  local rig_dev_dir = vim.fs.normalize('~/src/rig.nvim')
  local plugin_dir
  if vim.uv.fs_stat(rig_dev_dir) then
    plugin_dir = rig_dev_dir
  else
    plugin_dir = vim.fs.joinpath(vim.fn.stdpath('data'), 'site/pack/core/opt/rig.nvim')
    if not vim.uv.fs_stat(plugin_dir) then
      fetch('codebeige/rig.nvim', plugin_dir)
    end
  end

  local rig_lua = vim.fs.joinpath(plugin_dir, "lua/rig.lua")
  if not vim.uv.fs_stat(rig_lua) then
    dofile(vim.fs.joinpath(plugin_dir, "build.lua"))
  end
  vim.opt.rtp:prepend(plugin_dir)
end

local function init()
  load_rig()
  local rig = require("rig")
  rig.setup()
  require('config.base').setup()
  rig.exrc()

  require('plugins').setup()
end

local success, message = pcall(init)

if success then
  require('config').setup()
else
  print('Error: ' .. message)
end
