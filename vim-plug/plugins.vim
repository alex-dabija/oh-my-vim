call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'

  Plug 'unblevable/quick-scope'
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  Plug 'airblade/vim-rooter'

  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
