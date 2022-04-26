local utils = require('utils')

-- make sure file encoding is utf-8
utils.set('fileencoding', 'utf-8')

-- keep buffers open when not displayed
utils.set('hidden', true)

-- enable 24-bit colors
utils.set('termguicolors', true)

-- display cursor line and column when no status line is defined
utils.set('ruler', true)

-- display line numbers
utils.set('number', true)
utils.set('relativenumber', true)

-- display line limit column
utils.set('colorcolumn', '120')

-- always display sign column
utils.set('signcolumn', 'yes')

-- minimal number of screen lines to keep above and below the cursor
utils.set('scrolloff', 8)

-- don't redraw screen when executing macros
utils.set('lazyredraw', true)

-- enable list mode to display special characters
utils.set('list', true)
utils.set('listchars', 'tab:▸ ,eol:¬,extends:»,precedes:«,trail:•')

-- general tab behaviour
utils.set('expandtab', true)
utils.set('tabstop', 2)
utils.set('shiftwidth', 2)

-- faster current token highlight for treesitter-refactor
utils.set('updatetime', 300)

-- natural window splitting
utils.set('splitbelow', true)
utils.set('splitright', true)

-- highlight current line
utils.set('cursorline', true)

local group_file_type_config = 'ft_per_type_config'
vim.api.nvim_create_augroup(group_file_type_config, { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = group_file_type_config,
  pattern = '*',
  callback = function()
    require('filetypes').setup()
  end,
})

vim.api.nvim_exec([[
  augroup tridactyl_filetypes
    autocmd!
    autocmd BufNewFile,BufRead */tmp/tmp_github.com_*.txt :set filetype=markdown
  augroup END
]], false)
