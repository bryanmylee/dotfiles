" actions are prefixed with <Leader>
" ==================================

" clear search highLights
map <silent> <Leader>l :noh<CR>

" <Leader>f fzf
nmap <silent> <Leader>ff :Files<CR>
nmap <silent> <Leader>fl :BLines<CR>
nmap <silent> <Leader>fal :Lines<CR>
nmap <silent> <Leader>ft :BTags<CR>
nmap <silent> <Leader>fat :Tags<CR>
nmap <silent> <Leader>fb :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" <Leader>t vim-test
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>

