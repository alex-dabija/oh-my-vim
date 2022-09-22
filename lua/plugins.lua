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

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp-config').setup() end
  }

  -- UI plugins
  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.barbar').setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

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
    commit = "ec31655dc960c7d06fbfa0928f896923ef646f8a",
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
