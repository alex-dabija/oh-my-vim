local M = {}

local lspconfig = require('lspconfig')

function M.setup()
  lspconfig.rust_analyzer.setup{}
end

return M
