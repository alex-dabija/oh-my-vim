local M = {}

function M.setup()
  require('lualine').setup {
    extensions = { 'quickfix', 'nvim-tree' },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'filename'},
      lualine_c = {'lsp_progress'},
      lualine_x = {},
      lualine_y = {'encoding', 'fileformat', 'filetype'},
      lualine_z = {'branch', 'diff', 'diagnostics'},

    },
  }
end

return M
