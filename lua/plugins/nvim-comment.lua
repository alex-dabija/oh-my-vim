local M = {}

local keymaps = require('keymaps')

function M.setup()
  require('nvim_comment').setup {
    create_mappings = false,
  }

  keymaps.set_keymaps(keymaps.NVIM_COMMENT)
end

return M
