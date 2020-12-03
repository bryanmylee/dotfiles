" vim-airline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

" nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeNaturalSort = 1
let g:NERDTreeHijackNetrw = 1

" vista.vim
let g:vista_fold_toggle_icons = ['-', '+']
let g:vista_default_executive = 'coc'

" vim-startify
let g:startify_change_to_vcs_root = 1
"{{{ show all modified files of the current git repo
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
"}}}
"{{{ same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
"}}}
let g:startify_lists = [
            \ {'type': 'dir',                      'header': ['   Current Project']},
            \ {'type': function('s:gitModified'),  'header': ['   Modified']},
            \ {'type': function('s:gitUntracked'), 'header': ['   Untracked']},
            \ {'type': 'files',                    'header': ['   All Files']},
            \ {'type': 'sessions',                 'header': ['   Sessions']},
            \ {'type': 'bookmarks',                'header': ['   Bookmarks']},
            \ {'type': 'commands',                 'header': ['   Commands']},
            \ ]

" fzf
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" colors
let g:onedark_hide_endofbuffer = 1
let g:colorscheme_icons_targets = ['nerdtree', 'startify']

" vim-table-mode
let g:table_mode_corner='|'

