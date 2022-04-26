local M = {}

-- LSP reference highlighting
local group_name = 'lsp_document_highlight'

function M.create_augroup()
  vim.api.nvim_create_augroup(group_name, { clear = false })
end

function M.configure_highlights()
  local config = { cterm = { bold = true }, ctermbg = 'red', bg = '#464646' }
  vim.api.nvim_set_hl(0, 'LspReferenceRead', config)
  vim.api.nvim_set_hl(0, 'LspReferenceText', config)
  vim.api.nvim_set_hl(0, 'LspReferenceWrite', config)
end

function M.clear_autocmds(bufnr)
  vim.api.nvim_clear_autocmds({ group = group_name, buffer = bufnr })
end

local function configure_autocmd(bufnr, event, callback)
  vim.api.nvim_create_autocmd({ event }, {
    group = group_name,
    buffer = bufnr,
    callback = callback,
  })
end

function M.configure_autocmds(bufnr)
  configure_autocmd(bufnr, 'CursorHold', function()
    vim.lsp.buf.document_highlight()
  end)
  configure_autocmd(bufnr, 'CursorMoved', function()
    vim.lsp.buf.clear_references()
  end)
end

return M
