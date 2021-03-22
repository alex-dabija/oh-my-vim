
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {noremap = true, silent = true})
