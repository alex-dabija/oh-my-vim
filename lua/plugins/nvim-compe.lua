local M = {}

local utils = require('utils')
local keymaps = require('keymaps')

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

  keymaps.set_keymaps(keymaps.COMPE)
end

return M
