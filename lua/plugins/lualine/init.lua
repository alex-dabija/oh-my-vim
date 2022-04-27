local M = {}

local icons = {
  locker         = '', -- f023
  not_modifiable = '', -- f05e
  unsaved        = '', -- f0c7
  pencil         = '', -- f040
  dos            = '', -- e70f
  unix           = '', -- f17c
  mac            = '', -- f179
  page           = '☰', -- 2630
  line_number    = '', -- e0a1
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
  symbols = {
    added = icons.git_add .. ' ',
    modified = icons.git_modified .. ' ',
    removed = icons.git_deleted .. ' ',
  },
  cond = nil,
}

local lsp = {
  function()
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      return '' .. icons.disconnected .. ''
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
      table.insert(buf_client_names, client.name)
    end

    return icons.connected .. '  ' .. table.concat(buf_client_names, ', ')
  end,
  -- color = { gui = 'bold' },
  cond = hide_if_max_width,
}

local location = {
  function()
    local column = vim.fn.col('.')
    local line_number = vim.fn.line('.')
    local line_count = vim.fn.line('$')
    local percent = math.floor(100 * line_number / line_count)
    return string.format('%s%s:%s %s %s%s', icons.line_number, line_number, column, icons.page, percent, '%%')
  end,
}

local fileformat = require('plugins.lualine.components.fileformat')

function M.setup()
  require('lualine').setup {
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
