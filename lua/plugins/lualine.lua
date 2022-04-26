local M = {}

function M.setup()
  require('lualine').setup {
    extensions = { 'quickfix', 'nvim-tree' },
  }
end

return M
