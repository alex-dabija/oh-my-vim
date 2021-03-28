local M = {}

local utils = require('utils')
local lspconfig = require('lspconfig')
local virtual_text = require('plugins.lsp-config.virtual_text')
local buffer = require('plugins.lsp-config.buffer')

function M.setup()
  virtual_text.setup()
  configure_diagnostic_signs()

  lspconfig.rust_analyzer.setup {
    on_attach = configure_buffer,
    handlers = common_lsp_handlers(),
  }

  lspconfig.gopls.setup {
    on_attach = configure_buffer,
    handlers = common_lsp_handlers(),
  }
end

function configure_diagnostic_signs()
  configure_diagnostic_sign("LspDiagnosticsSignError", "")
  configure_diagnostic_sign("LspDiagnosticsSignWarning", "")
  configure_diagnostic_sign("LspDiagnosticsSignInformation", "")
  configure_diagnostic_sign("LspDiagnosticsSignHint", "")
end

function configure_diagnostic_sign(sign_name, sign)
  vim.fn.sign_define(sign_name, { texthl = sign_name, text = sign, numhl = sign_name })
end

function configure_buffer(client, bufnr)
  local buf = buffer.new(client, bufnr)

  virtual_text.on_attach(buf)

  buf:set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf:set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  buf:set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  buf:set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  buf:set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  buf:set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf:set_keymap('n', '<Leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf:set_keymap('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
  buf:set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
  buf:set_keymap('n', '<Leader>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  buf:set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  buf:set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  buf:set_keymap('n', '<Leader>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  buf:set_keymap('n', '<Leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  buf:set_keymap('n', '<Leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  buf:set_keymap('n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      highlight LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      highlight LspReferenceText cterm=bold ctermbg=red guibg=#464646
      highlight LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  configure_telescope_for_lsp(buf)
end

function configure_telescope_for_lsp(buf)
  if utils.is_telescope_available() then
    buf:set_keymap('n', '<Leader>ca', ':Telescope lsp_code_actions<CR>')
    buf:set_keymap('n', '<Leader>dd', ':Telescope lsp_document_diagnostics<CR>')
    buf:set_keymap('n', '<Leader>wd', ':Telescope lsp_workspace_diagnostics<CR>')
  end
end

function common_lsp_handlers()
  return {
    ["textDocument/publishDiagnostics"] = virtual_text.on_publish_diagnostics,
  }
end

return M
