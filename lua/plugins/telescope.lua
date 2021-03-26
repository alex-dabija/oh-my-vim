local M = {}

local actions = require('telescope.actions')

function M.setup()
  vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope marks<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope registers<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope treesitter<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope vim_options<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Leader>fk', ':Telescope keymaps<CR>', {noremap = true, silent = true})

  require('telescope').setup {
    defaults = {
      borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
      layout_strategy = 'horizontal',
      layout_defaults = {
        horizontal = {
          scroll_speed = 5,
        },
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<A-j>"] = actions.preview_scrolling_down,
          ["<A-k>"] = actions.preview_scrolling_up,
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<A-j>"] = actions.preview_scrolling_down,
          ["<A-k>"] = actions.preview_scrolling_up,
        },
      },
    },
  }
end

return M
