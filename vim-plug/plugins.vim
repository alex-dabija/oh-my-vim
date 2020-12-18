call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-devicons.git'
  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-airline.git'

  Plug 'git@git.tools.kbee.xyz:opensource/vim/quick-scope.git'
  Plug 'git@git.tools.kbee.xyz:opensource/vim/dracula-vim-theme.git', { 'as': 'dracula' }

  Plug 'git@git.tools.kbee.xyz:opensource/vim/coc-nvim.git', {'branch': 'release'}
  Plug 'git@git.tools.kbee.xyz:opensource/vim/coc-fzf.git'

  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-rooter.git'
  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-commentary.git'

  Plug 'git@git.tools.kbee.xyz:opensource/vim/fzf-vim.git'

  Plug 'git@git.tools.kbee.xyz:opensource/vim/vista-vim.git'

  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-gitgutter.git'

  " Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-go.git'
  Plug 'git@git.tools.kbee.xyz:opensource/vim/vim-polyglot.git'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
