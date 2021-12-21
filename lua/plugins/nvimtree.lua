local M = {}

local keymaps = require('keymaps')

function M.setup()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_indent_markers = 1

  require('nvim-tree').setup {
    auto_close = true,
    update_focused_file = {
      enable = true,
    }
  }

  keymaps.set_keymaps(keymaps.NVIM_TREE)
end

return M
