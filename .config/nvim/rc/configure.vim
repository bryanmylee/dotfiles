let mapleader=","
set showcmd

set nocompatible
set fileformats=unix

filetype off
filetype plugin on
filetype plugin indent on

" enable mouse support
set mouse=a

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set synmaxcol=3000

" required for coc
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" always show sign column to prevent window shifting
set signcolumn=yes
" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" shift to the next round tab stop
set shiftround
" enable relative line numbers
set number
set relativenumber
" enable line wrapping
set wrap linebreak nolist
" enable highlighted search
set hlsearch
set incsearch
" smart case pattern matching
set ignorecase
set smartcase
" enable syntax folding
set foldmethod=syntax
set nofoldenable
" conceal config
set conceallevel=2
set concealcursor="nc"
" strip trailing whitespaces
autocmd BufWritePre * %s/\v\s+$//e
" open new horizontal panes below the current pane
set splitbelow
" manual motion-based folding
set foldmethod=manual

let g:python3_host_prog = "/usr/local/bin/python3"

