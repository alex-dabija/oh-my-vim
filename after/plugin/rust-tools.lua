local rt = require("rust-tools")
local keymaps = require('keymaps')

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

      keymaps.set_buf_keymaps(bufnr, keymaps.LSP);
    end,
  },
})
