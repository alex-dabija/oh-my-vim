local lsp = require('plugins.lualine.components.lsp')
local diff = require('plugins.lualine.components.diff')
local location = require('plugins.lualine.components.location')
local fileformat = require('plugins.lualine.components.fileformat')
local diagnostics = require('plugins.lualine.components.diagnostics')

require('lualine').setup {
  options = {
    icons_enabled = true,
  },
  extensions = { 'quickfix', 'nvim-tree' },
  sections = {
    lualine_a = { 'mode'},
    lualine_b = { 'filename', 'branch' },
    lualine_c = { diff, 'lsp_progress' },
    lualine_x = { lsp, diagnostics },
    lualine_y = { fileformat, 'filetype' },
    lualine_z = { location },
  },
}
