" actions are prefixed with <Leader>
" ==================================

" clear search highLights
map <silent> <Leader>l :noh<CR>

" <Leader>f fzf
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" <Leader>t vim-test
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>

" <Bslash>q focus previews
nnoremap <silent> <Bslash>q :wincmd p<CR>
