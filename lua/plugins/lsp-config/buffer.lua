Buffer = {}

function Buffer:new(o, bufnr)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.bufnr = bufnr
  return o
end

function Buffer:set_keymaps(group)
  require('keymaps').set_buf_keymaps(self.bufnr, group)
end

function Buffer:set_option(name, value)
  vim.api.nvim_buf_set_option(self.bufnr, name, value)
end

local M = {}

function M.new(bufnr)
  return Buffer:new(nil, bufnr)
end

return M
