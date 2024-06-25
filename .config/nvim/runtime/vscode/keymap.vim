" [g and ]g to navigate diagnostics
nnoremap [g <Cmd>lua require('vscode').call('editor.action.marker.prev')<CR>
nnoremap ]g <Cmd>lua require('vscode').call('editor.action.marker.next')<CR>

" gh to show documentation in preview window.
nnoremap gh <Cmd>lua require('vscode').call('editor.action.showHover')<CR>

" Find implementation
nnoremap gi <Cmd>lua require('vscode').call('editor.action.goToImplementation')<CR>

" Find definition
" nmap <silent> gd <Plug>(coc-definition)
nnoremap gd <Cmd>lua require('vscode').call('editor.action.revealDefinition')<CR>

" Find references
nnoremap gj <Cmd>lua require('vscode').call('editor.action.goToReferences')<CR>

" Rename symbol
nnoremap gn <Cmd>lua require('vscode').call('editor.action.rename')<CR>

" git stuff
" [h and ]h to navigate git changes
nnoremap [h <Cmd>lua require('vscode').call('workbench.action.editor.previousChange')<CR>
nnoremap ]h <Cmd>lua require('vscode').call('workbench.action.editor.nextChange')<CR>

" hp to preview hunks
nnoremap hp <Cmd>lua require('vscode').call('editor.action.dirtydiff.next')<CR>


" Folds
nnoremap zc <Cmd>lua require('vscode').call('editor.fold')<CR>
nnoremap zC <Cmd>lua require('vscode').call('editor.foldAll')<CR>
nnoremap zo <Cmd>lua require('vscode').call('editor.unfold')<CR>
nnoremap zO <Cmd>lua require('vscode').call('editor.unfoldAll')<CR>
nnoremap zr <Cmd>lua require('vscode').call('editor.foldRecursively')<CR>
nnoremap zR <Cmd>lua require('vscode').call('editor.unfoldRecursively')<CR>
