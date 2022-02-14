if not pcall(require, 'neoclip') then
  return
end

if not pcall(require, 'telescope') then
  return
end

require('neoclip').setup()
require('telescope').load_extension('neoclip')
