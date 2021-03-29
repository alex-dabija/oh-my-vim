Buffer = {}

function Buffer:new(o, client, bufnr)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.client = client
  self.bufnr = bufnr
  return o
end

function Buffer:set_keymaps(group)
  -- TODO: validate that opts & keys are not nil
  local opts = group.opts
  for i, value in ipairs(group.keys) do
    vim.api.nvim_buf_set_keymap(self.bufnr, value.mode, value.lhs, value.rhs, opts)
  end
end

function Buffer:set_option(name, value)
  vim.api.nvim_buf_set_option(self.bufnr, name, value)
end

local M = {}

function M.new(client, bufnr)
  return Buffer:new(client, bufnr)
end

return M
