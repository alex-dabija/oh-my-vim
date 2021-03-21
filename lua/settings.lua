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
