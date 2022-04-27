local M = {}

function M.setup()
  local opts = { noremap = true, silent = true }
  require('legendary').setup {
    keymaps = {
      { '<Leader>ve', ':edit $MYVIMRC<CR>',    description = 'Edit VIM configuration',   opts = opts },
      { '<Leader>vs', ':luafile $MYVIMRC<CR>', description = 'Source VIM configuration', opts = opts },

      { '<C-Up>',    ':resize -2<CR>',          description = 'Decrease window height', opts = opts },
      { '<C-Down>',  ':resize +2<CR>',          description = 'Increase window height', opts = opts },
      { '<C-Left>',  ':vertical resize -2<CR>', description = 'Decrease window width',  opts = opts },
      { '<C-Right>', ':vertical resize +2<CR>', description = 'Increase window width',  opts = opts },
    }
  }
end

return M
