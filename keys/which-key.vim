" map leader to which key
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}

let g:which_key_sep = ''

" let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]

let g:which_key_map.f = { 'name' : '+search' }
" let g:which_key_map.f.r = { 'name': 'Files' }
" let g:which_key_map.f.b = { 'name': 'Buffers' }
let g:which_key_map.f.r = [ ':Files', 'files' ]
let g:which_key_map.f.b = [ ':Buffers', 'buffers' ]

call which_key#register('<Space>', "g:which_key_map")
