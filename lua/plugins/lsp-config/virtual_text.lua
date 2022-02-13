local M = {}

local keymaps = require('keymaps')

local enabled = true

function M.setup()
  vim.api.nvim_exec([[
    command! -nargs=0 LspVirtualTextToggle lua require('plugins.lsp-config.virtual_text').toggle()
  ]], false)
end

function M.on_attach(buffer)
  buffer:set_keymaps(keymaps.VIRTUAL_TEXT)
end

function M.should_display()
  return enabled
end

function M.toggle()
  enabled = not enabled
  -- vim.diagnostic.show(nil, 0, vim.diagnostic.get(0, nil), {virtual_text = enabled})
  vim.diagnostic.show(nil, 0, nil, {virtual_text = enabled})
end

function M.on_publish_diagnostics(err, method, result, client_id, bufnr, config)
  local config = config or {}
  config.virtual_text = M.should_display()
  vim.lsp.diagnostic.on_publish_diagnostics(err, method, result, client_id, bufnr, config)
end

return M
