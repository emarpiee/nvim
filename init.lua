require('core.keymaps')
require('core.options')

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end

end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  require 'plugins.colortheme',

  -- buffer line (with tabpage integration)
  require 'plugins.bufferline',

  -- status line
  require 'plugins.lualine',

  -- a fzf alternative
  require 'plugins.telescope',

  -- portable package manager
  require 'plugins.mason',

  -- nvim-cmp, this is required for Mason LSP
  require 'plugins.autocompletion',

  require 'plugins.gitsigns',

  -- helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
  require 'plugins.which-key',

  require 'plugins.autopairs',

  -- highlight, list and search todo comments in your projects
  require 'plugins.todo',

  -- high-performance color highlighter
  require 'plugins.colorizer',

  -- A collection of small QoL pluins for Neovim
  require 'plugins.snacks',

  -- plugin to help easily manage multiple terminal windows
  require 'plugins.toggleterm',

  -- multiple curosrs
  require 'plugins.vim-visual-multi',

  -- smol game to make you better with vim
  require 'plugins.vimbegood',

  -- Library of 40+ independent Lua modules
  require 'plugins.mini-nvim'

  -- require 'plugins.obsidian',
  -- require 'plugins.treesitter',
})


vim.cmd.colorscheme 'retrobox'
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ffffff" })

