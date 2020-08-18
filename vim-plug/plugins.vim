call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'

  Plug 'unblevable/quick-scope'
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'

  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-commentary'

  Plug 'junegunn/fzf.vim'

  Plug 'liuchengxu/vista.vim'

  Plug 'airblade/vim-gitgutter'

  " Plug 'fatih/vim-go'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
