let mapleader=","
set showcmd

set nocompatible
set fileformats=unix

filetype off
filetype plugin on
filetype plugin indent on

" enable mouse support
set mouse=a

" performace tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required for coc
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" vim can merge sign and number column now.
set signcolumn=number
" show existing tab with 4 spaces width
set tabstop=4
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

