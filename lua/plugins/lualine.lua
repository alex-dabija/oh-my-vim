local M = {}

local window_max_width = 70

local function hide_if_max_width()
  return vim.fn.winwidth(0) > window_max_width
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  cond = hide_if_max_width,
}

function M.setup()
  require('lualine').setup {
    extensions = { 'quickfix', 'nvim-tree' },
    sections = {
      lualine_a = { 'mode'},
      lualine_b = { 'filename', 'branch' },
      lualine_c = { 'diff', 'lsp_progress' },
      lualine_x = { diagnostics },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'location' },

    },
  }
end

return M
