local M = {}

local keymaps = require('keymaps')

function M.setup()
  require('gitsigns').setup {
    keymaps = {},
  }

  keymaps.set_keymaps(keymaps.GITSIGNS)
  keymaps.set_keymaps(keymaps.GITSIGNS_NAVIGATION)
end

return M
