" [g and ]g to navigate diagnostics
map [g <Action>(GotoPreviousError)
map ]g <Action>(GotoNextError)

" gd gj gi to go to definition, references, and implementations
map gd <Action>(GotoDeclaration)
" IdeaVIM uses the same action for both go-to definition and find references
map gj <Action>(GotoDeclaration)
map gi <Action>(GotoImplementation)

" gh to show documentation in preview window.
map gh <Action>(QuickJavaDoc)

" gk to show quick actions
map gk <Action>(ShowIntentionActions)

" Rename symbol
map gn <Action>(RenameElement)

" git stuff
" [h and ]h to navigate git changes
map [h <Action>(VcsShowPrevChangeMarker)
map ]h <Action>(VcsShowNextChangeMarker)
map ,gd <Action>(Compare.SameVersion)
map ,gb <Action>(Annotate)

" zen
map <Bslash>z <Action>(ToggleDistractionFreeMode)

" structure
map <Bslash>v <Action>(ActivateStructureToolWindow)

