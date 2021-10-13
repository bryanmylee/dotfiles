call plug#begin('~/.config/nvim/vim-plug')

" +---------+
" | EDITING |
" +---------+
Plug 'tpope/vim-repeat'                " Enables . for repeating plugin commands
Plug 'junegunn/vim-easy-align'         " ga<motion> or <selection>ga
Plug 'christoomey/vim-sort-motion'     " gs<motion> or <selection>gs
Plug 'vim-scripts/ReplaceWithRegister' " gr<motion>
Plug 'tpope/vim-surround'              " cs<motion>, ds<motion>, ys<motion>
Plug 'michaeljsmith/vim-indent-object' " <text object>: ai ii aI
Plug 'wellle/targets.vim'              " A whole bunch of text objects
Plug 'dhruvasagar/vim-table-mode'      " <Leader>tm
Plug 'vim-scripts/DoxygenToolkit.vim'  " Generate doxygen comments for C and other languages
" vim-easymotion for VSCode
Plug 'asvetliakov/vim-easymotion'       " <Leader><Leader>f, F, t, T
if !exists('g:vscode')
    Plug 'tpope/vim-commentary'            " gc<motion>
else
    " Use default VSCode comment functionality.
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
endif

if !exists('g:vscode')
    " +----+
    " | UI |
    " +----+
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes' " A pretty status bar
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'liuchengxu/vista.vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify' " A start screen for vim on an empty buffer
    Plug 'Yggdroot/indentLine'
    Plug 'ryanoasis/vim-devicons'
    Plug 'bryanmylee/vim-colorscheme-icons'
    " +-----+
    " | Nav |
    " +-----+
    Plug 'psliwka/vim-smoothie'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " +------------------+
    " | Language Support |
    " +------------------+
    let g:polyglot_disabled = ['latex', 'python']
    Plug 'mattn/emmet-vim'      " Provide emmet-style HTML completion and generation
    Plug 'sheerun/vim-polyglot' " Enables more language syntax support
    Plug 'neoclide/jsonc.vim', { 'for': ['json', 'jsonc'] }
    Plug 'lervag/vimtex'
    Plug 'plasticboy/vim-markdown'
    Plug 'evanleck/vim-svelte'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'honza/vim-snippets'
    " +--------+
    " | Colors |
    " +--------+
    Plug 'arzg/vim-colors-xcode'
    Plug 'joshdick/onedark.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'ntk148v/vim-horizon'
    Plug 'ericbn/vim-solarized'
    " +-----+
    " | git |
    " +-----+
    Plug 'tpope/vim-fugitive' " A git wrapper
    Plug 'airblade/vim-gitgutter'
    if has('nvim-0.5')
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " treesitter-based highlighting
        Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}
    endif
endif

call plug#end()

