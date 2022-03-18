if not pcall(require, 'nvim-tree') then
  return
end

-- vim.g.nvim_tree_width = 40
vim.g.nvim_tree_indent_markers = 1

require('nvim-tree').setup {
  auto_close = true,
  view = {
    width = 70,
  },
  update_focused_file = {
    enable = true,
  }
}

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.NVIM_TREE)
