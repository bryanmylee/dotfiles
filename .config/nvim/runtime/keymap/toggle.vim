" toggles are prefixed with <Bslash>
" ==================================

" toggle relative Number
nnoremap <silent> <Bslash>n :set relativenumber!<CR>

" nerdtree
nmap <silent> <Bslash>b :NERDTreeToggle<CR>
" additional nerdtree mappings
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenRecursively = 'zo'
let g:NERDTreeMapCloseDir = 'zc'
let g:NERDTreeMapCloseChildren = 'c'
let g:NERDTreeMapJumpRoot = 'gg'
let g:NERDTreeMapToggleHidden = 'zh'

" vista.vim
nmap <silent> <Bslash>v :Vista!!<CR>

" undotree
nmap <silent> <Bslash>u :UndotreeToggle<CR>

" indentline
nmap <silent> <Bslash>i :IndentLinesToggle<CR>

" vim-table-mode
" disable default table mode mapping with a long prefix
let g:table_mode_map_prefix = "<Leader>xxxxxxxxxx"
let g:table_mode_disable_mappings = 1
let g:table_mode_disable_tableize_mappings = 1
nmap <silent> <Bslash>t :call tablemode#Toggle()<CR>

" vim-smoothie
" toggle smooth navigation
nnoremap <silent> <Bslash>s :let g:smoothie_enabled = !g:smoothie_enabled<CR>
