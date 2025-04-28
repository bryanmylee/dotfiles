" <Leader>g git stuff
nmap <Leader>ga :G add %<CR>
nmap <Leader>gc :G commit %<CR>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gD :Gvdiff --staged<CR>
nmap <Leader>gl :G log --graph --oneline --decorate<CR>
nmap <Leader>gs :G status<CR>
nmap <Leader>gb :G blame<CR>

" goto next hunk
nmap <silent> ]h :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR>

" hunk preview
nmap <silent> <Leader>hp :GitGutterPreviewHunk<CR>
nmap <silent> <Leader>hs :GitGutterStageHunk<CR>
nmap <silent> <Leader>hu :GitGutterUndoHunk<CR>
autocmd CursorHold * :GitGutterAll

