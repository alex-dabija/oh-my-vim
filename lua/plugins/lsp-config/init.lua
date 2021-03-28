local M = {}

local utils = require('utils')
local lspconfig = require('lspconfig')
local virtual_text = require('plugins.lsp-config.virtual_text')
local buffer = require('plugins.lsp-config.buffer')
local keymaps = require('keymaps')

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
  buf:set_keymaps(keymaps.LSP)

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
    buf:set_keymaps(keymaps.LSP_TELESCOPE)
  end
end

function common_lsp_handlers()
  return {
    ["textDocument/publishDiagnostics"] = virtual_text.on_publish_diagnostics,
  }
end

return M
