local M = require('lualine.component'):extend()

local symbols = {
  connected      = '', -- f817
  disconnected   = '', -- f818
}

function M:init(options)
  M.super.init(self, options)
  self.symbols = vim.tbl_extend('keep', self.options.symbols or {}, symbols)
end

function M:update_status()
  local icons = self.symbols

  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if self.options.icons_enabled then
      return icons.disconnected
    else
      return '[LSP: disconnected]'
    end
  end

  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local clients = table.concat(buf_client_names, ', ')
  if self.options.icons_enabled then
    return string.format('%s  %s', icons.connected, clients)
  else
    return string.format('[LSP: %s]', clients)
  end
end

return M
