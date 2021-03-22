local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute('packadd packer.nvim')
end

local packer = require('packer')
packer.startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- LSP
  use {'neovim/nvim-lspconfig'}

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter').setup() end
  }
  use {'nvim-treesitter/nvim-treesitter-refactor'}
  use {'nvim-treesitter/playground'}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function() require('plugins.telescope').setup() end
  }

  -- Colorschemes
  -- use {
  --   'dracula/vim',
  --   as = 'dracula',
  --   config = function() require('utils').set_colorscheme('dracula') end
  -- }
  use {
    'christianchiarulli/nvcode-color-schemes.vim',
    config = function() require('utils').set_colorscheme('dracula') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvimtree').setup() end
  }
end)


local config = {
  script_path = require('utils').script_path(),
  checksum_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'oh-my-vim', 'plugins.lua.sha256'),
  packer_script_path = packer.config.compile_path,
}
require('plugins.updater').update(config)
