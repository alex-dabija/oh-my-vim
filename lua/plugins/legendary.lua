local M = {}

local utils = require('utils')

function M.setup()
  local opts = { noremap = true, silent = true }
  require('legendary').setup {
    keymaps = {
      -- Edit/source configuration file bindings
      { '<Leader>ve', ':edit $MYVIMRC<CR>',    description = 'Edit Neovim configuration',   opts = opts },
      { '<Leader>vs', ':luafile $MYVIMRC<CR>', description = 'Source Neovim configuration', opts = opts },

      -- Window resize bindings
      { '<C-Up>',    ':resize -2<CR>',          description = 'Decrease window height', opts = opts },
      { '<C-Down>',  ':resize +2<CR>',          description = 'Increase window height', opts = opts },
      { '<C-Left>',  ':vertical resize -2<CR>', description = 'Decrease window width',  opts = opts },
      { '<C-Right>', ':vertical resize +2<CR>', description = 'Increase window width',  opts = opts },

      -- Window split bindings
      { '<C-w>s',    ':split<CR>',  description = 'Horizontal split', opts = opts },
      { '<C-w>v',    ':vsplit<CR>', description = 'Vertical split',   opts = opts },

      -- Buffer bindings
      { '<Leader>bd', ':BufferDelete!<CR>', description = 'Delete current buffer', opts = opts },

      -- Neovim tabs bindings
      { '<Leader>nt', ':tabnew<CR>',    description = 'New tab',                   opts = opts },
      { '<C-w>T',     ':tabedit %<CR>', description = 'Current buffer in new tab', opts = opts },
      { '<Leader>ct', ':tabclose<CR>',  description = 'Close current tab',         opts = opts },
      { '<Leader>to', ':tabonly<CR>',   description = 'Keep only current tab',     opts = opts },

      -- Terminal bindings
      { '<Space>ts', ':split term://zsh<CR>',  description = 'New terminal in horizontal split', opts = opts },
      { '<Space>tv', ':vsplit term://zsh<CR>', description = 'New terminal in vertical split',   opts = opts },
      { '<Space>te', ':edit term://zsh<CR>',   description = 'New terminal in current window',   opts = opts },
      { '<Space>tt', ':tabnew term://zsh<CR>', description = 'New terminal in new tab',          opts = opts },

      -- Toggle settings bindings
      { '<Leader>th', utils.toggle_hlsearch,         description = 'Toggle search highlighting', opts = opts },
      { '<Leader>ts', utils.toggle_en_spellchecking, description = 'Toggle EN spellchecking',    opts = opts },

      -- Insert mode bindings
      { '<BS>',  '<Nop>', mode = 'i', description = 'Disable backspace key in instert mode', opts = opts },
      { '<Del>', '<Nop>', mode = 'i', description = 'Disable del key in insert mode',        opts = opts },
    }
  }
end

return M
