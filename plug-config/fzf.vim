" configure history file
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] jump to the existing window if possible
let g:fzf_buffers_jump = 1

" border color
let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

" let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
