" map leader to which key
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}

let g:which_key_sep = ''


let g:which_key_map.f = { 'name' : '+search' }
let g:which_key_map.f.r = [ ':Files', 'files' ]
let g:which_key_map.f.b = [ ':Buffers', 'buffers' ]
let g:which_key_map.f.d = [ ':CocFzfList diagnostics', 'diagnostics' ]
let g:which_key_map.f.o = [ ':CocFzfList outline', 'outline' ]

call which_key#register('<Space>', "g:which_key_map")
