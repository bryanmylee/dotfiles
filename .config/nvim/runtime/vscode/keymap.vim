" [g and ]g to navigate diagnostics
nnoremap [g <Cmd>call VSCodeCall('editor.action.marker.prev')<CR>
nnoremap ]g <Cmd>call VSCodeCall('editor.action.marker.next')<CR>

" g<Space> to trigger actions.
nmap <silent> g<Space> :CocAction<CR>

" gh to show documentation in preview window.
nnoremap gh <Cmd>call VSCodeCall('editor.action.showHover')<CR>

" Find implementation
nnoremap gi <Cmd>call VSCodeCall('editor.action.goToImplementation')<CR>

" Find definition
" nmap <silent> gd <Plug>(coc-definition)
nnoremap gd <Cmd>call VSCodeCall('editor.action.revealDefinition')<CR>

" Find references
nnoremap gj <Cmd>call VSCodeCall('editor.action.goToReferences')<CR>

" Rename symbol
nnoremap gn <Cmd>call VSCodeCall('editor.action.rename')<CR>

" Folds
nnoremap zc <Cmd>call VSCodeCall('editor.fold')<CR>
nnoremap zC <Cmd>call VSCodeCall('editor.foldAll')<CR>
nnoremap zo <Cmd>call VSCodeCall('editor.unfold')<CR>
nnoremap zO <Cmd>call VSCodeCall('editor.unfoldAll')<CR>
nnoremap zr <Cmd>call VSCodeCall('editor.foldRecursively')<CR>
nnoremap zR <Cmd>call VSCodeCall('editor.unfoldRecursively')<CR>
