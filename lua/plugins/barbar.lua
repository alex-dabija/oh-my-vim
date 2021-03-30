local M = {}

local keymaps = require('keymaps')

function M.setup()
  keymaps.set_keymaps(keymaps.BARBAR)

  local bufferline = {}
  bufferline.auto_hide = false
  bufferline.animation = false
  bufferline.closable = false
  bufferline.clickable = false
  bufferline.maximum_padding = 2
  vim.api.nvim_set_var('bufferline', bufferline)
end

return M
