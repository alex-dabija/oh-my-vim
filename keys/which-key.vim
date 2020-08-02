" map leader to which key
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}

let g:which_key_sep = ''

let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]

call which_key#register('<Space>', "g:which_key_map")
