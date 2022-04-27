local M = require('lualine.component'):extend()

local symbols = {
  page           = '☰', -- 2630
  line_number    = '', -- e0a1
}

function M:init(options)
  M.super.init(self, options)
  self.symbols = vim.tbl_extend('keep', self.options.symbols or {}, symbols)
end

function M:update_status()
  local column = vim.fn.col('.')
  local line = vim.fn.line('.')
  local line_count = vim.fn.line('$')
  local percent = math.floor(100 * line / line_count)

  if self.options.icons_enabled then
    local icons = self.symbols
    return string.format('%s%s:%s %s %s%s', icons.line_number, line, column, icons.page, percent, '%%')
  else
    return string.format('%s:%s [%s%s]', line, column, percent, '%%')
  end
end

return M
