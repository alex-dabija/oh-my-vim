" enable powerline fonts
let g:airline_powerline_fonts = 1

" clear separator characters
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" disable vim show mode
" mode is now displayed by airline, ex: --INSERT--
set noshowmode

" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

" do not show splits when in tab mode because they are already visible
let g:airline#extensions#tabline#show_splits = 0

" show path for files
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable webdevicons for airline
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
