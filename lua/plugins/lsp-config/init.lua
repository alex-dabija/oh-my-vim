local M = {}

local utils = require('utils')
local lspconfig = require('lspconfig')
local virtual_text = require('plugins.lsp-config.virtual_text')
local buffer = require('plugins.lsp-config.buffer')
local keymaps = require('keymaps')

local function configure_diagnostic_sign(sign_name, sign)
  vim.fn.sign_define(sign_name, { texthl = sign_name, text = sign, numhl = sign_name })
end

local function configure_diagnostic_signs()
  configure_diagnostic_sign("LspDiagnosticsSignError", "")
  configure_diagnostic_sign("LspDiagnosticsSignWarning", "")
  configure_diagnostic_sign("LspDiagnosticsSignInformation", "")
  configure_diagnostic_sign("LspDiagnosticsSignHint", "")
end

local function configure_telescope_for_lsp(buf)
  if utils.is_telescope_available() then
    buf:set_keymaps(keymaps.LSP_TELESCOPE)
  end
end

local function configure_buffer(client, bufnr)
  local buf = buffer.new(bufnr)
  virtual_text.on_attach(buf)
  buf:set_keymaps(keymaps.LSP)

  if client.resolved_capabilities.document_highlight then
    local config = { cterm = { bold = true }, ctermbg = 'red', bg = '#464646' }
    vim.api.nvim_set_hl(0, 'LspReferenceRead', config)
    vim.api.nvim_set_hl(0, 'LspReferenceText', config)
    vim.api.nvim_set_hl(0, 'LspReferenceWrite', config)

    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  configure_telescope_for_lsp(buf)
end

local function common_lsp_handlers()
  return {
    ["textDocument/publishDiagnostics"] = virtual_text.on_publish_diagnostics,
  }
end

function M.setup()
  virtual_text.setup()
  configure_diagnostic_signs()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local servers = { 'rust_analyzer', 'gopls', 'pylsp', 'ansiblels' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = configure_buffer,
      handlers = common_lsp_handlers(),
      capabilities = capabilities,
    }
  end

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  lspconfig.sumneko_lua.setup {
    on_attach = configure_buffer,
    handlers = common_lsp_handlers(),
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          maxPreload = 10000,
        },
        telemetry = {
        },
      },
    },
  }
end

return M
