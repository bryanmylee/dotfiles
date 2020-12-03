call plug#begin('~/.config/nvim/vim-plug')

" ui
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes' " A pretty status bar
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify' " A start screen for vim on an empty buffer
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
" nav
Plug 'psliwka/vim-smoothie'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" language support
let g:polyglot_disabled = ['latex', 'python']
Plug 'sheerun/vim-polyglot' " Enables more language syntax support
Plug 'neoclide/jsonc.vim', { 'for': ['json', 'jsonc'] }
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
" colors
Plug 'arzg/vim-colors-xcode'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'ntk148v/vim-horizon'
Plug 'ericbn/vim-solarized'
" git
Plug 'tpope/vim-fugitive' " A git wrapper
Plug 'airblade/vim-gitgutter'
" editing
Plug 'tpope/vim-repeat'                " Enables . for repeating plugin commands
Plug 'junegunn/vim-easy-align'         " ga<motion> or <selection>ga
Plug 'christoomey/vim-sort-motion'     " gs<motion> or <selection>gs
Plug 'tpope/vim-commentary'            " gc<motion>
Plug 'vim-scripts/ReplaceWithRegister' " gr<motion>
Plug 'tpope/vim-surround'              " cs<motion>, ds<motion>, ys<motion>
Plug 'easymotion/vim-easymotion'       " <Leader><Leader>f, F, t, T
Plug 'michaeljsmith/vim-indent-object' " <text object>: ai ii aI
Plug 'wellle/targets.vim'              " A whole bunch of text objects
Plug 'dhruvasagar/vim-table-mode'      " <Leader>tm
Plug 'mattn/emmet-vim'                 " Provide emmet-style HTML completion and generation
Plug 'vim-scripts/DoxygenToolkit.vim'  " Generate doxygen comments for C and other languages
" autocomplete
Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}
Plug 'honza/vim-snippets'
" tests
Plug 'janko/vim-test'

call plug#end()

