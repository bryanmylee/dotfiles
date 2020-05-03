" |----------|
" | Vim Plug |
" |----------|
call plug#begin('~/.vim/vim-plug') "{{{

" |---|-----------|
" | - | Interface |
" |---|-----------|
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " A pretty status bar
" {{{
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
"}}}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" {{{
" Open NERDTree if launching vim on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeNaturalSort = 1
let g:NERDTreeHijackNetrw = 1
" let g:NERDTreeCascadeSingleChildDir = 0
"}}}
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify' " A start screen for vim on an empty buffer
"{{{
let g:startify_lists = [
      \ { 'type': 'dir'   , 'header': ['   ' . getcwd() ] } ,
      \ { 'type': 'files' , 'header': ['   Recents'     ] } ,
      \ ]
"}}}
Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'


" |---|------------|
" | - | Navigation |
" |---|------------|
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"{{{
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"{{{
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
"}}}
"}}}


" |---|---------------------|
" | - | Syntax Highlighting |
" |---|---------------------|
Plug 'arzg/vim-colors-xcode'
Plug 'joshdick/onedark.vim'
"{{{
let g:onedark_hide_endofbuffer = 1
"}}}
Plug 'sheerun/vim-polyglot' " Enables more language syntax support
"{{{
let g:polyglot_disabled = ['latex', 'python']
"}}}
Plug 'neoclide/jsonc.vim', { 'for': ['json', 'jsonc'] }


" |---|-------------------|
" | - | Language Specific |
" |---|-------------------|
Plug 'lervag/vimtex'
" vimtex config {{{
set grepprg=grep\ -nH\ $*
set sw=2
set iskeyword+=:
let g:tex_flavor='latex'
let g:tex_fold_enabled=1
let g:tex_nospell=1
let g:tex_no_error=1
let g:vimtex_view_automatic=1
" tex_conceal options are:
" a -
" b -
" d - delimiters
" m - math symbols
" g - general symbols
let g:tex_conceal=''

let g:vimtex_view_method='skim'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status) "{{{
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
"}}}
"}}}
Plug 'plasticboy/vim-markdown'
"{{{ Markdown settings
let g:vim_markdown_folding_level = 2

let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
"}}}


" |---|-----|
" | - | Git |
" |---|-----|
Plug 'airblade/vim-gitgutter'
"{{{
" Goto next hunk
nmap <silent> ]h :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR>
" Hunk preview
nmap <silent> <Leader>hp :GitGutterPreviewHunk<CR>
"}}}
Plug 'tpope/vim-fugitive' " A git wrapper


" |---|---------|
" | - | Editing |
" |---|---------|
Plug 'dhruvasagar/vim-table-mode' " <Leader>tm
"{{{
let g:table_mode_corner='|'
"}}}
Plug 'junegunn/vim-easy-align' " ga<motion> or <selection>ga
Plug 'tpope/vim-surround' " ds<motion>, cs<motion>, ys<motion>
Plug 'tpope/vim-commentary' " gc<motion>
Plug 'easymotion/vim-easymotion' " <Leader><Leader><motion>
Plug 'vim-scripts/ReplaceWithRegister' " gr<motion>
Plug 'michaeljsmith/vim-indent-object' " <text object>: ai ii aI
Plug 'tpope/vim-repeat' " Enables . for repeating plugin commands
Plug 'christoomey/vim-sort-motion' " Provide different ways to sort with motions
Plug 'mattn/emmet-vim' " Provide emmet-style HTML completion and generation


" |---|--------------|
" | - | Autocomplete |
" |---|--------------|
Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}
Plug 'SirVer/ultisnips'
" {{{
" Have to include both variants of the directory due to differences in
" processing on macOS and Ubuntu
let g:UltiSnipsSnippetDirectories = ['ultisnips', '~/.vim/ultisnips']
"}}}
Plug 'honza/vim-snippets'


" |---|-------|
" | - | Tests |
" |---|-------|
Plug 'janko/vim-test'


" |---|------|
" | - | DBMS |
" |---|------|
Plug 'vim-scripts/dbext.vim'
"{{{
let g:dbext_default_profile_usual = 'type=MYSQL:user=bryan:passwd=saturdayvibes'
let g:dbext_default_profile = 'usual'
"}}}

call plug#end()
"}}}


" |------------------|
" | General Settings |
" |------------------|
" General Settings {{{
set nocompatible
set fileformats=unix

filetype off
filetype plugin on
filetype plugin indent on

" Enable mouse support
set mouse=a

" Performace tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" Required for coc
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c


set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" shift to the next round tab stop
set shiftround

" enable line numbers
set number

" enable line wrapping
set wrap linebreak nolist

" enable highlight search
set hlsearch

" highlight while search
set incsearch

" case insensitivity pattern matching
set ignorecase

" override ignore case if pattern contains upcase
set smartcase

" enable syntax folding
set foldmethod=syntax
set nofoldenable

" conceal config
set conceallevel=2
set concealcursor="nc"

set splitbelow
"}}}


" |--------------|
" | Key Mappings |
" |--------------|
" Key map for built-in features {{{

" Mapping leader key to ,
let mapleader=","
set showcmd


" Make up and down move to the next display line, not file line
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap j gj
nnoremap k gk

" Start and end of line with <Space> and <CR>
nnoremap <silent> <CR> g$
nnoremap <silent> <Space> g^

" Move the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Toggle relative number
set relativenumber
nnoremap <silent> <Leader>n :set relativenumber!<CR>

" Clear search highlights
map <silent> <Leader>l :noh<CR>

" Redo with U instead of <C-r>
nnoremap U <C-r>

" Copy to system clipboard
xnoremap yp "+y
nnoremap <silent> yp "+y
nnoremap <silent> ypp "+yy


" |---|----------|
" | - | Terminal |
" |---|----------|
" Opening the terminal in the current directory
nmap <silent> <Leader>` :let $CURR_FILE=expand('%:t')<CR>:let $VIM_DIR=expand('%:p:h')<CR>:split<CR>:terminal<CR>icd $VIM_DIR<CR><C-l>

" Run the current file in terminal
nmap <silent> <Leader>r <Leader>`run $CURR_FILE<CR>

" Escape insert mode in terminal
tnoremap <Leader><Esc> <Esc>
tnoremap <Esc> <C-\><C-n>

" <C-w> to escape, then <C-w>
tnoremap <C-w> <C-\><C-n><C-w>

"}}}

" Key map for plugins {{{
" NERDTree
nmap <silent> <Leader>b :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenRecursively = 'zo'
let g:NERDTreeMapCloseDir = 'zc'
let g:NERDTreeMapCloseChildren = 'c'
let g:NERDTreeMapJumpRoot = 'gg'
let g:NERDTreeMapToggleHidden = 'zh'

nmap <silent> <Leader>B :TagbarToggle<CR>

nmap <silent> <Leader>u :UndotreeToggle<CR>

nmap <silent> <Leader>i :IndentLinesToggle<CR>

" FZF
nmap <silent> <Leader>p :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" coc.nvim
"{{{
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-svelte',
    \ 'coc-tsserver',
    \]

" Use Tab for trigger completion with characters ahead and navigate.
" {{{ <Tab>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
"}}}
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use K to show documentation in preview window.
" {{{ show_documentation()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"}}}
"{{{ check_back_space()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"}}}

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Find the implementation of the function
nmap <silent> gi <Plug>(coc-implementation)

" Find the type definition of the function
nmap <silent> gt <Plug>(coc-implementation)

" Find the definition of a function
nmap <silent> gd <Plug>(coc-definition)

" Find references to the function
nmap <silent> gj <Plug>(coc-references)

" Symbol renaming.
nmap <Leader>fn <Plug>(coc-rename)

nmap <silent> <C-Space> :CocAction('doHover')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
"}}}

" UltiSnips
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

" Fugitive.vim
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>
nnoremap <Leader>gr :Gread<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" emmet-vim
let g:user_emmet_leader_key='<C-j>'

" vim-test
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>

" dbext
nmap <silent> <Leader>seip Vip<Leader>se
nmap <silent> <Leader>seii Vii<Leader>se
nmap <silent> <Leader>sei) vi)<Leader>se
nmap <silent> <Leader>sei( vi(<Leader>se
nmap <silent> <Leader>sdbn :DBSetOption dbname=
"}}}


" |-----------------|
" | Custom Features |
" |-----------------|
" {{{ Custom Features
" <C-u> deletes a line while in Insert mode. Add undo points before it.
inoremap <C-u> <C-g>u<C-u>
"}}}


" |---------|
" | Theming |
" |---------|
" Theme config {{{
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme onedark
let g:airline_theme='atomic'

function! ToggleDarkMode()
  if &background == 'dark'
    set background=light
    colorscheme xcodelight
  else
    set background=dark
    colorscheme onedark
  endif
endfunction

nmap <silent> <Leader>c :call ToggleDarkMode()<CR>
"}}}

