local M = {}

local utils = require('utils')

M.update = function(config)
  utils.sha256sum(config.script_path, function(new_hash)
    local old_hash = utils.read_value_from_file(config.checksum_path)

    if new_hash ~= old_hash or vim.fn.empty(vim.fn.glob(config.packer_script_path)) > 0 then
      vim.api.nvim_command('PackerSync')
      -- TODO: execute only after a successful PackerSync
      utils.write_value_to_file(config.checksum_path, new_hash)
    end
  end)
end

return M
