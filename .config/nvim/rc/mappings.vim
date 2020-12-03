" toggles are prefixed with <Bslash>
source ~/.config/nvim/rc/mappings-toggle.vim

" actions are prefixed with <Leader>
source ~/.config/nvim/rc/mappings-actions.vim

" plugin text editing functions are prefixed with g
source ~/.config/nvim/rc/mappings-editing.vim

" the built-in terminal requires some special mappings
source ~/.config/nvim/rc/mappings-terminal.vim

" coc navigation mappings are defined in configure-coc
" coc extension actions are prefixed with <Leader>c
source ~/.config/nvim/rc/mappings-coc-actions.vim

" move to the next displayed line with j and k
nnoremap j gj
nnoremap k gk

" start and end of line with <Space> and <CR>
nnoremap <silent> <CR> g$
nnoremap <silent> <Space> g^

" redo with U instead of <C-r>
nnoremap U <C-r>

" Ctrl-C, X, and V for copy, cut, paste to system
xnoremap <C-c> "+y
xnoremap <C-x> "+x
map <C-v> "+gP

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

" emmet-vim
let g:user_emmet_leader_key='<C-j>'

