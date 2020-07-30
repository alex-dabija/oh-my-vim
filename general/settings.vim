" disable vi compatibility mode
set nocompatible

" enable per file type settings
filetype on
filetype plugin on
filetype indent on

" enable syntax highlighting
syntax on

" display line numbers
set number
set relativenumber

" use true type colors
if has("termguicolors")
  set termguicolors
endif

" tab behavior
set expandtab      " replace tabs with spaces
set tabstop=2      " use a default tab length of 2
set shiftwidth=2   " use default ident size of 2
autocmd FileType java setlocal expandtab
autocmd FileType java setlocal tabstop=4
autocmd FileType java setlocal shiftwidth=4

" configure default theme
" colorscheme base16-default-dark
" set background=dark
colorscheme dracula

" display column limit
set colorcolumn=120

" keep 8 lines above and below the cursor when scrolling
set scrolloff=8

" don't redraw the screen while executing macros
set lazyredraw

" remove trailing whitespaces from all files
" autocmd BufWritePre <buffer> :%s/\s+$//e

" remove trailing whitespaces only from specific file types
" autocmd FileType java,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" use nice characters to display non printable characters
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:•

" always display non printable chars
set list

" make sure backspace can always be used in INSERT mode
set backspace=indent,eol,start

" configure leader key
let mapleader = ","
