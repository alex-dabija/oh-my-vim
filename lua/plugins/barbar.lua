local M = {}

local keymaps = require('keymaps')

function M.setup()
  keymaps.set_keymaps(keymaps.BARBAR)

  vim.g.bufferline = {
    auto_hide = false,
    animation = false,
    closable = false,
    clickable = false,
    maximum_padding = 2,
  }
end

return M
