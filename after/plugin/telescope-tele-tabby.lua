if not pcall(require, 'telescope._extensions.tele_tabby') then
  return
end

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.TELE_TABBY)
