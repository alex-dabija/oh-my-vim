call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'

  Plug 'unblevable/quick-scope'
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'antoinemadec/coc-fzf'

  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-commentary'

  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'liuchengxu/vim-which-key'
  Plug 'liuchengxu/vista.vim'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
