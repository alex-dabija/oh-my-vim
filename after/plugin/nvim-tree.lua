if not pcall(require, 'nvim-tree') then
  return
end

require('nvim-tree').setup {
  view = {
    width = 70,
  },
  render = {
    indent_markers = {
      enable = true,
    }
  },
  update_focused_file = {
    enable = true,
  }
}

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.NVIM_TREE)
