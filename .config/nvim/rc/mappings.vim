" move to the next displayed line with j and k
nnoremap j gj
nnoremap k gk

" start and end of line with <Space> and <CR>
nnoremap <silent> <CR> g$
nnoremap <silent> <Space> g^

" toggle relative number
nnoremap <silent> <Leader>n :set relativenumber!<CR>

" clear search highlights
map <silent> <Leader>l :noh<CR>

" redo with U instead of <C-r>
nnoremap U <C-r>

" copy to system clipboard
xnoremap Y "+y
nnoremap <silent> Y "+y
nnoremap <silent> YY "+yy

