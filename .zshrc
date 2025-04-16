zmodload zsh/zprof

# zplug
# =====
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "agkozak/zsh-z"
zplug "plugins/git", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh"
host=`hostname`
ZSH_THEME=robbyrussell

# nvm
# ===
export NVM_DIR="$HOME/.nvm"

# Must be exported before plugins are loaded.
export NVM_LAZY_LOAD=true

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
# git
alias ga="git add"
alias gb="git branch"
alias gbdcheck="git fetch -p && git branch -vv | awk '/: gone]/{print $1}'"
alias gbd="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs -0 git branch -D"
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
alias gphpub='eval "git push -u origin `git rev-parse --abbrev-ref HEAD`"'
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
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
# _evalcache jenv init -

# rvm
# ===
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Remote / SSH configuration
# ==========================
export GPG_TTY=$(tty)
# For local machines only
export DISPLAY=:0
# For remote Linux machines only
# alias pbcopy="xclip -in -selection clipboard"

# Utilities
# =========
function trash() { mv "$@" ~/.Trash; }

# Logging utilities
# =================
logprint() { tee >(sed -r 's/\x1b\[[0-9;]*m//g' > "$1") }
alias now='echo $(date -u +"%Y-%m-%dT%H%M%SZ")'
# This allows us to do something like:
# ./runProcess | logprint ./logs/`now`.log

