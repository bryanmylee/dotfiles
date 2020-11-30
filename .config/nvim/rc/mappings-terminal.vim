" Opening the terminal in the current directory
nmap <silent> <Leader>` :let $CURR_FILE=expand('%:t')<CR>:let $VIM_DIR=expand('%:p:h')<CR>:split<CR>:terminal<CR>icd $VIM_DIR<CR><C-l>

" Run the current file in terminal
nmap <silent> <Leader>r <Leader>`run $CURR_FILE<CR>

" Escape insert mode in terminal
tnoremap <Leader><Esc> <Esc>
tnoremap <Esc> <C-\><C-n>

" <C-w> to escape, then <C-w>
tnoremap <C-w> <C-\><C-n><C-w>

