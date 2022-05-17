zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh"
host=`hostname`
if [[ $host == "bryan-server" ]]; then
    ZSH_THEME="gallois-server"
else
    ZSH_THEME="gallois-home"
fi

# nvm
# ===
export NVM_DIR="$HOME/.nvm"
# Disabled in favour of zsh-nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Must be exported before plugins are loaded.
export NVM_LAZY_LOAD=true

plugins=(
    git
    z
    zsh-syntax-highlighting
    zsh-nvm
    # evalcache
)

source "$ZSH/oh-my-zsh.sh"

# Use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Timing
timezsh() {
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# User configuration
# ==================
export TERM=xterm-256color
export VISUAL='nvim'

# nnn
# ===
export EDITOR="/bin/nvim"
source "$HOME/.scripts/sh/quitcd.sh"

# dotfiles
# ========
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

# vi
# ==
bindkey -v
export KEYTIMEOUT=1

# vi for tab completion
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

# bat
# ===
export BAT_THEME="OneHalfDark"

# iTerm
# =====
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf
# ===
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

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
alias run="~/.scripts/sh/run.sh"
# git
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcnv="git commit --no-verify"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gl="git log --graph"
alias glo="git log --graph --oneline --decorate"
alias glpf="git log -p --follow"
alias gmv="git mv"
alias gph="git push"
alias gpl="git pull"
alias gri="git rebase -i"
alias gs="git status"
alias gsh="git stash"
alias gsp="git stash pop"

# direnv
# ======
eval "$(direnv hook zsh)"
# _evalcache direnv hook zsh

# jenv
# ====
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# _evalcache jenv init -

# rvm
# ===
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Local private config
# ====================
LOCAL_SCRIPT="$HOME/.config/local-config.sh"
if [[ -f "$LOCAL_SCRIPT" ]]; then
    source "$LOCAL_SCRIPT"
fi

module_init
