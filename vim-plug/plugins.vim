call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'

  Plug 'unblevable/quick-scope'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
