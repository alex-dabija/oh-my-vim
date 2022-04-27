local M = {}

function M.setup()
  require('legendary').setup {
    keymaps = {
      { '<Leader>ve', ':edit $MYVIMRC<CR>', description = 'Edit VIM configuration', opts = {}},
      { '<Leader>vs', ':luafile $MYVIMRC<CR>', description = 'Source VIM configuration', opts = {}},
    }
  }
end

return M
