# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh"

ZSH_THEME="my-gallois"

# Use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(
    git
    z
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/Scripts/sh/ranger-cd.sh"


# User configuration
# ==================
export TERM=xterm-256color
export VISUAL='nvim'

# dotfiles
# ========
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no


# Vi 
# ==
bindkey -v
export KEYTIMEOUT=1

# Vi for tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Edit line in vim with <C-e>
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || 
         [[ ${KEYMAP} == viins ]] || 
         [[ ${KEYMAP} == '' ]] || 
         [[ $1 == 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use the beam cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use the beam cursor for new prompts

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# bat config
export BAT_THEME="OneHalfDark"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

# Aliases
# =======
# Fix for sudo
alias sudo='sudo '
# Repeat last command with sudo
alias please='eval "sudo $( fc -ln -1 )"'
# Route vim to nvim
alias vim='nvim'
alias vi='vim'
alias v='vim'
# Shortcut for vim fzf
alias vimf='nvim "`fzf`"'
alias vf='vimf'
# Code-Runner imitation
alias run="~/Scripts/sh/run.sh"
# git
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gf="git fetch"
alias gl="git log --graph"
alias glo="git log --graph --oneline --decorate"
alias gb="git branch"
alias gpl="git pull"
alias gph="git push"
alias gco="git checkout"
alias gsh="git stash"
alias gsp="git stash pop"

source "$HOME/.local-scripts.sh"

