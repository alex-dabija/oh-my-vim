local M = {}

function M.setup()
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
    refactor = {
      highlight_definitions = {
        enable = true
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
  }
end

return M
