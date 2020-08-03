" map leader to which key
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

nnoremap <silent> ] :silent <C-u> :silent WhichKey ']'<CR>
nnoremap <silent> [ :silent <C-u> :silent WhichKey '['<CR>

let g:which_key_map = {}

let g:which_key_sep = ''


let g:which_key_map.f = { 'name' : '+search' }
let g:which_key_map.f.r = [ ':Files', 'files' ]
let g:which_key_map.f.b = [ ':Buffers', 'buffers' ]
let g:which_key_map.f.d = [ ':CocFzfList diagnostics', 'diagnostics' ]
let g:which_key_map.f.o = [ ':CocFzfList outline', 'outline' ]


let g:which_key_map.t = { 'name': '+toggle' }
let g:which_key_map.t.g = { 'name': '+git' }
let g:which_key_map.t.g.a = [ ':GitGutterToggle', 'git-gutter' ]
let g:which_key_map.t.g.b = [ ':GitGutterBufferToggle', 'git-gutter-buffer' ]
let g:which_key_map.t.g.s = [ ':GitGutterSignsToggle', 'git-gutter-signs' ]
let g:which_key_map.t.g.h = [ ':GitGutterLineHighlightsToggle', 'git-gutter-highlight' ]
let g:which_key_map.t.g.n = [ ':GitGutterLineNrHighlightsToggle', 'git-gutter-number-hightlight' ]

call which_key#register('<Space>', 'g:which_key_map')

" let g:which_key_map_square_close = {}

" let g:which_key_map_x.c = [ ':GitGutterNextHunk', 'GitGutterNextHunk' ]

" call which_key#register(']', 'g:which_key_map_x')
