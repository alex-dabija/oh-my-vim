local M = {}

local keymaps = require('keymaps')

function M.setup()
  keymaps.set_keymaps(keymaps.HOP)
  require('hop').setup()
end

return M
