if not pcall(require, 'session_manager') then
  return
end

if not pcall(require, 'plenary') then
  return
end

local Path = require('plenary.path')
require('session_manager').setup({
  session_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
  path_replacer = '__',
  colon_replacer = '++',
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_filetypes = {
    'gitcommit',
  },
  autosave_only_in_session = false,
  max_path_length = 120,
})

local keymaps = require('keymaps')
keymaps.set_keymaps(keymaps.NVIM_SESSION)
