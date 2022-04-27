local M = require('lualine.component'):extend()

local symbols = {
  unix = '', -- e712
  dos = '',  -- e70f
  mac = '',  -- e711
}

function M:init(options)
  M.super.init(self, options)
  self.symbols = vim.tbl_extend('keep', self.options.symbols or {}, symbols)
end

function M:update_status()
  local format = string.format('[%s]', vim.bo.fileformat)
  if self.options.icons_enabled then
    local result = self.symbols[vim.bo.fileformat]
    if result then
      format = result
    end
  end

  return string.format('%s %s', format, vim.opt.fileencoding:get())
end

return M
