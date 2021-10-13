source ~/.config/nvim/runtime/vim-plug.vim
source ~/.config/nvim/runtime/base.vim
source ~/.config/nvim/runtime/keymap/init.vim
if !exists('g:vscode')
  source ~/.config/nvim/runtime/ui.vim
  source ~/.config/nvim/runtime/theme.vim
  source ~/.config/nvim/runtime/configure/git.vim
  if has('nvim-0.5')
    source ~/.config/nvim/runtime/configure/coc.vim
    source ~/.config/nvim/runtime/treesitter.vim
  endif
else
  source ~/.config/nvim/runtime/vscode/keymap.vim
endif

