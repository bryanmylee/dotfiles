zmodload zsh/zprof

# zplug
# =====
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

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
ZSH_THEME=af-magic

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
export EDITOR="/bin/nvim"

# dotfiles
# ========
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

# direnv
# ======
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# vi mode
# =======
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
if command -v bat >/dev/null 2>&1; then
    export BAT_THEME="TwoDark"
fi

# lf
# ==
if command -v lf >/dev/null 2>&1; then
    lfcd () {
        # `command` is needed in case `lfcd` is aliased to `lf`
        cd "$(command lf -print-last-dir "$@")"
    }
    alias lf='lfcd'
fi

# fzf
# ===
if command -v fzf >/dev/null 2>&1; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_COMMAND='fd --type f'
    alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
fi

# lsd
# ===
if command -v lsd >/dev/null 2>&1; then
    alias ols='command ls'
    alias ls='lsd'
fi

# neovim
# ======
if command -v nvim >/dev/null 2>&1; then
    # Route vim to nvim
    alias vim='nvim'
    alias vi='vim'
    alias v='vim'
    # Shortcut for vim fzf
    alias vimf='nvim "`fzf`"'
    alias vf='vimf'
fi

# Fix for sudo
alias sudo='sudo '
# Repeat last command with sudo
alias please='eval "sudo $( fc -ln -1 )"'

# git
# ===
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

# iTerm
# =====
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

