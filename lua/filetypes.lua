local buffer = require('plugins.lsp-config.buffer')

local M = {}

local default_config = {
  autoformat_on_save = false,
  global_variables = {},
  buffer_options = {},
}

local actions = {}

local configs = setmetatable({}, {
  __index = function(t, filetype)
    local config = {}
    local has_package, package = pcall(require, 'filetypes.' .. filetype)
    if has_package and package ~= nil then
      config = package
    end

    config = vim.tbl_extend('keep', config, default_config)
    config = vim.tbl_extend('keep', config, actions)
    config.filetype = filetype
    return config
  end
})

function actions:setup_autoformat_on_save()
  if self.autoformat_on_save then
    -- local cmd = string.format([[
    --   augroup ft_%s_format
    --     autocmd!
    --     autocmd BufWritePre *.%s :lua require('utils').lsp_format_file()
    --   augroup END
    -- ]], self.filetype, vim.fn.expand('%:e'))
    -- vim.api.nvim_exec(cmd, false)
  end
end

function actions:set_buffer_options(buf)
  for name, value in pairs(self.buffer_options) do
    buf:set_option(name, value)
  end
end

function actions:set_global_variables()
  for name, value in pairs(self.global_variables) do
    vim.api.nvim_set_var(name, value)
  end
end

function M.setup()
  local buf = buffer.new(vim.api.nvim_get_current_buf())
  local filetype = vim.api.nvim_buf_get_option(buf.bufnr, 'filetype')
  local config = configs[filetype]
  config:set_global_variables()
  config:setup_autoformat_on_save()
  config:set_buffer_options(buf)
end

return M
