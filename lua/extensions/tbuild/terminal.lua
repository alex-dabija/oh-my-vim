local Window = require('extensions.tbuild.window')
local Terminal = {
  bufs = {},
  last_winid = nil,
  last_term = nil,
}

function Terminal:new(window)
  self.window = window or Window:new()
  return self
end

function Terminal:open(term_number)
  local create_win = not self.window:is_valid()
  local create_buf = self.bufs[term_number] == nil

  if create_win and create_buf then
    self.last_winid = vim.api.nvim_get_current_win()
    self.window:create_term()
    table.insert(self.bufs, self.window:get_bufnr())
  elseif create_win then
    self.last_winid = vim.api.nvim_get_current_win()
    self.window:create(self.bufs[term_number])
  elseif create_buf then
    self.window:focus()
    vim.cmd(':terminal')
    table.insert(self.bufs, self.window:get_bufnr())
  else
    local curr_term_buf = self.bufs[term_number]
    local last_term_buf = self.bufs[self.last_term]
    if curr_term_buf ~= last_term_buf then
      self.window:set_buf(curr_term_buf)
    end
  end
  self.last_term = term_number
end

function Terminal:close()
  local current_winid = vim.api.nvim_get_current_win()

  if self.window:is_valid() then
    self.window:close()
    if current_winid == self.window.winid then
      vim.api.nvim_set_current_win(self.last_winid)
    end
  end
end

function Terminal:toggle()
  self.last_term = self.last_term or 1
  local opened = self.window:is_valid()
  if opened then
    self:close()
  else
    self:open(self.last_term)
  end
end

return Terminal
