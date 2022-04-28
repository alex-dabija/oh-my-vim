local M = {}

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
    }
  }
end

return M
