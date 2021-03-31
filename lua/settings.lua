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

-- TODO: replace with native feature after PR is merged: https://github.com/neovim/neovim/pull/12378
vim.api.nvim_exec([[
  augroup ft_gitconfig
    autocmd!
    autocmd FileType gitconfig setlocal noexpandtab
    autocmd FileType gitconfig setlocal tabstop=4
    autocmd FileType gitconfig setlocal shiftwidth=4
  augroup END
]], false)

vim.api.nvim_exec([[
  augroup ft_golang
    autocmd!
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal tabstop=2
    autocmd FileType go setlocal shiftwidth=2
  augroup END
]], false)
