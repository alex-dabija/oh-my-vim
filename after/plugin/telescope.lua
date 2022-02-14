if not pcall(require, 'telescope') then
  return
end

local keymaps = require('keymaps')
local actions = require('telescope.actions')

keymaps.set_keymaps(keymaps.TELESCOPE)

require('telescope').setup {
  defaults = {
    borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
    layout_strategy = 'horizontal',
    layout_config = {
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
