" nerdtree
nmap <silent> <Leader>b :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenRecursively = 'zo'
let g:NERDTreeMapCloseDir = 'zc'
let g:NERDTreeMapCloseChildren = 'c'
let g:NERDTreeMapJumpRoot = 'gg'
let g:NERDTreeMapToggleHidden = 'zh'

" tagbar
nmap <silent> <Leader>B :TagbarToggle<CR>

" undotree
nmap <silent> <Leader>u :UndotreeToggle<CR>

" indentline
nmap <silent> <Leader>i :IndentLinesToggle<CR>

" fzf
nmap <silent> <Leader>p :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" emmet-vim
let g:user_emmet_leader_key='<C-j>'

" vim-test
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>

nmap <silent> <Leader>xy :Vimxy<CR>

