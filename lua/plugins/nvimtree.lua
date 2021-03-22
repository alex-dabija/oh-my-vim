local M = {}

function M.setup()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_indent_markers = 1

  vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
end

return M
