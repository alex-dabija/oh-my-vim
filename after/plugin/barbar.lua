local keymaps = require('keymaps')

keymaps.set_keymaps(keymaps.BARBAR)

require('bufferline').setup {
  auto_hide = false,
  animation = false,
  closable = false,
  clickable = false,
  maximum_padding = 2,
}
