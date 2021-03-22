local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {"c", "lua"},
    highlight = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false, -- do not persist queries across vim sessions
    },
  }
end

return M
