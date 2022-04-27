local M = {}

local icons = {
  locker         = '', -- f023
  not_modifiable = '', -- f05e
  unsaved        = '', -- f0c7
  pencil         = '', -- f040
  connected      = '', -- f817
  disconnected   = '', -- f818
  error          = '', -- f658
  warning        = '', -- f071
  hint           = '', -- f0eb
  info           = '', -- f05a
  git            = '', -- e725
  git_add        = '', -- f2ba
  git_modified   = '', -- f459
  git_deleted    = '', -- f458
  paste          = '', -- f691
}

local window_max_width = 70

local function hide_if_max_width()
  return vim.fn.winwidth(0) > window_max_width
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = {
    error = icons.error .. ' ',
    warn = icons.warning .. ' ',
    info = icons.info .. ' ',
    hint = icons.hint .. ' ',
  },
  cond = hide_if_max_width,
}

local lsp = require('plugins.lualine.components.lsp')
local diff = require('plugins.lualine.components.lsp')
local location = require('plugins.lualine.components.location')
local fileformat = require('plugins.lualine.components.fileformat')

function M.setup()
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
end

return M
