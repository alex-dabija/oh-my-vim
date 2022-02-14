if not pcall(require, 'gitsigns') then
  return
end

require('gitsigns').setup {
  keymaps = {},
}

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.GITSIGNS)
keymaps.set_keymaps(keymaps.GITSIGNS_NAVIGATION)
