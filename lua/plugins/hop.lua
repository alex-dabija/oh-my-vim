local M = {}

local keymaps = require('keymaps')

function M.setup()
  keymaps.set_keymaps(keymaps.HOP)
end

return M
