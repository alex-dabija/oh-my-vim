local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {"c", "lua"},
    highlight = {
      enable = true,
    },
  }
end

return M
