local M = {}

local saga = require('lspsaga')

function M.setup()
  saga.init_lsp_saga()
end

return M
