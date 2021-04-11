local M = {}

local keymaps = require('keymaps')

function M.setup()
  keymaps.set_keymaps(keymaps.TELE_TABBY)
end

return M
