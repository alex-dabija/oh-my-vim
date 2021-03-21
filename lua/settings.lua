local utils = require('utils')

-- make sure file encoding is utf-8
utils.set('fileencoding', 'utf-8')

-- keep buffers open when not displayed
vim.o.hidden = true

-- enable 24-bit colors
vim.o.termguicolors = true

-- display cursor line and column when no status line is defined
vim.o.ruler = true

-- minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 8

-- don't redraw screen when executing macros
vim.o.lazyredraw = true

-- enable list mode to display special characters
utils.set('list', true)
