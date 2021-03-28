local M = {}

local keymaps = require('keymaps')

function M.setup()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_indent_markers = 1

  keymaps.set_keymaps(keymaps.NVIM_TREE)
end

return M
