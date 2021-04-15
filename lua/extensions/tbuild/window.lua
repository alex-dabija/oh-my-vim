local Window = {}

function Window:new(opt)
  opt = opt or {}

  self.pos = opt.pos or 'botright'
  self.split = opt.split or 'sp'
  self.width = opt.width or nil
  self.height = opt.height or nil

  return self
end

function Window:create(bufnr)
  local cmd = '%s %s +buffer\\ %d'
  vim.cmd(cmd:format(self.pos, self.split, bufnr))

  self.winid = vim.fn.win_getid()
  self:update_size()

  return self.winid
end

function Window:create_term()
  local cmd = '%s new +term'
  vim.cmd(cmd:format(self.pos))

  self.winid = vim.fn.win_getid()
  self:update_size()

  return self.winid
end

function Window:update_size()
  if self.width ~= nil then
    vim.api.nvim_win_set_width(self.winid, self.width)
  end
  if self.height ~= nil then
    vim.api.nvim_win_set_height(self.winid, self.height)
  end
end

function Window:get_size()
  local width = vim.api.nvim_win_get_width(self.winid)
  local height = vim.api.nvim_win_get_height(self.winid)
  return width, height
end

function Window:close()
  if self:is_valid() then
    vim.api.nvim_win_close(self.winid, false)
  end
end

function Window:is_valid()
  if (self.winid == nil) then
    return false
  end
  return vim.api.nvim_win_is_valid(self.winid)
end

function Window:focus()
  vim.api.nvim_set_current_win(self.winid)
end

function Window:get_bufnr()
  if self:is_valid() then
    return vim.api.nvim_win_get_buf(self.winid)
  end
  return nil
end

return Window
