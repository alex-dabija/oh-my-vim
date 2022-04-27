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

local diff = {
  'diff',
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = { added = '  ', modified = ' ', removed = ' ' },
  cond = nil,
}

function M.setup()
  require('lualine').setup {
    extensions = { 'quickfix', 'nvim-tree' },
    sections = {
      lualine_a = { 'mode'},
      lualine_b = { 'filename', 'branch' },
      lualine_c = { diff, 'lsp_progress' },
      lualine_x = { diagnostics },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'location' },

    },
  }
end

return M
