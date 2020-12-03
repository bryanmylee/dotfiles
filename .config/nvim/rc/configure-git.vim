" <Leader>g git stuff
nmap <Leader>g<Space> :Git \
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gc :Gcommit %<CR>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gD :Gvdiff!<CR>
nmap <Leader>gl :Git log --graph --oneline --decorate<CR>
nmap <Leader>gmm :Grename \
nmap <Leader>gmv :Gmove \
nmap <Leader>gph :Gpush
nmap <Leader>gpl :Gpull
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gr :Gread<CR>

" goto next hunk
nmap <silent> ]h :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR>

" hunk preview
nmap <silent> <Leader>hp :GitGutterPreviewHunk<CR>
nmap <silent> <Leader>hs :GitGutterStageHunk<CR>
nmap <silent> <Leader>hu :GitGutterUndoHunk<CR>
autocmd CursorHold * :GitGutterAll

