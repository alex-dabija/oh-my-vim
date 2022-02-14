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
  use {
    'neovim/nvim-lspconfig',
    --'git@git.tools.kbee.xyz:opensource/vim/nvim-lspconfig.git',
    as = 'nvim-lspconfig',
    -- branch = 'fix-lsp-new-file',
    config = function() require('plugins.lsp-config').setup() end
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function() require('plugins.lsp-saga').setup() end,
    disable = true,
  }
  use {
    'kosayoda/nvim-lightbulb',
    config = function() require('plugins.nvim-lightbulb').setup() end
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp').setup() end,
  }
  use {'hrsh7th/cmp-nvim-lsp'}

  -- Snippets
  use {'saadparwaiz1/cmp_luasnip'}
  use {'L3MON4D3/LuaSnip'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-refactor'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
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
  use {
    'TC72/telescope-tele-tabby.nvim',
    config = function() require('plugins.telescope-tele-tabby').setup() end
  }

  -- Colorschemes
  -- use {
  --   'dracula/vim',
  --   as = 'dracula',
  --   config = function() require('utils').set_colorscheme('dracula') end
  -- }
  -- use {
  --   'christianchiarulli/nvcode-color-schemes.vim',
  --   after = 'galaxyline.nvim',
  --   config = function() require('utils').set_colorscheme('dracula') end
  -- }

  use {
    'folke/tokyonight.nvim',
    after = 'galaxyline.nvim',
    config = function() require('utils').set_colorscheme('tokyonight') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvimtree').setup() end
  }

  -- UI plugins
  use {
    'romgrk/barbar.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function() require('plugins.barbar').setup() end
  }

  use {
    'NTBBloodbath/galaxyline.nvim',
    branch = 'main',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
    config = function() require('plugins.galaxyline').setup() end
  }

  -- Git
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb'}

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
    },
    config = function() require('plugins.gitsigns').setup() end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('plugins.comment').setup() end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  use {
    'phaazon/hop.nvim',
    config = function() require('plugins.hop').setup() end
  }

  use {
    'ojroques/vim-oscyank',
    config = function() require('plugins.oscyank').setup() end
  }
end)


local config = {
  script_path = require('utils').script_path(),
  checksum_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'oh-my-vim', 'plugins.lua.sha256'),
  packer_script_path = packer.config.compile_path,
}
require('plugins.updater').update(config)
