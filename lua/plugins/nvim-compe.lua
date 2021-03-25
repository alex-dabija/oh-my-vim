local M = {}

local utils = require('utils')

function M.setup()
  -- autocompletion menu behaviour
  utils.set('completeopt', 'menuone,noselect')

  require('compe').setup {
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = false,
    }
  }

  local opts = {noremap = true, silent = true, expr = true}
  vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', opts)
  vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', opts)
  vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', opts)
  vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({"delta": +4})', opts)
  vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({"delta": -4})', opts)
end

return M
