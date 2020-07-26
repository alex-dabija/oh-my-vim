call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'vim-airline/vim-airline'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
