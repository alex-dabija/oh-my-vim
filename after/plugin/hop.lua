if not pcall(require, 'hop') then
  return
end

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.HOP)

require('hop').setup()
