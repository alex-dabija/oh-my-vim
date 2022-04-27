local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute('packadd packer.nvim')
end

local packer = require('packer')
packer.startup(function(use)
  -- Package manager
  use {'wbthomason/packer.nvim'}

  -- Common
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'kyazdani42/nvim-web-devicons'}

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp-config').setup() end
  }
  use {'kosayoda/nvim-lightbulb'}

  -- Autocomplete
  use {'hrsh7th/nvim-cmp'}
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
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-ui-select.nvim'}
  use {'TC72/telescope-tele-tabby.nvim'}

  -- Session manager
  use {'Shatur/neovim-session-manager'}

  -- Colorschemes
  -- use {
  --   'dracula/vim',
  --   as = 'dracula',
  --   config = function() require('utils').set_colorscheme('dracula') end
  -- }

  use {
    'folke/tokyonight.nvim',
    after = 'lualine.nvim',
    -- config = function() require('utils').set_colorscheme('tokyonight') end
  }
  use {
    'EdenEast/nightfox.nvim',
    after = 'lualine.nvim',
    config = function() require('utils').set_colorscheme('nightfox') end
  }

  use {'kyazdani42/nvim-tree.lua'}

  -- UI plugins
  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.barbar').setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'arkav/lualine-lsp-progress',
    config = function() require('plugins.lualine').setup() end
  }
  use {
    'arkav/lualine-lsp-progress',
  }

  -- Git
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb'}
  use {'lewis6991/gitsigns.nvim'}

  use {'numToStr/Comment.nvim'}

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  use {'phaazon/hop.nvim'}

  use {
    'ojroques/vim-oscyank',
    config = function() require('plugins.oscyank').setup() end
  }

  use {'AckslD/nvim-neoclip.lua'}

  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }

  -- Github PRs and issues management
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function() require('plugins.notify').setup() end,
  }

  use {
    'mrjones2014/legendary.nvim',
    config = function() require('plugins.legendary').setup() end,
  }
end)


local config = {
  script_path = require('utils').script_path(),
  checksum_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'oh-my-vim', 'plugins.lua.sha256'),
  packer_script_path = packer.config.compile_path,
}
require('plugins.updater').update(config)
