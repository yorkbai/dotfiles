# Path to your oh-my-zsh installation.
export ZSH=/Users/yorkbai/.oh-my-zsh

#docker 
# eval "$(docker-machine env default)"

export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

export TMOUT=100000
export EDITOR="vim"
setopt HIST_IGNORE_ALL_DUPS
setopt no_nomatch
setopt HIST_NO_STORE
setopt extended_glob
setopt correct
export TERM=xterm-color
autoload -U zmv
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

setopt hist_ignore_space
alias cd=" cd"
alias ls=" ls -G"
alias cat=" cat"
# alias t='/Users/yorkbai/bin/todo.txt_cli-2.10/todo.sh'

# zsh promt like vi
bindkey -v 
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey "^K" push-line
bindkey "^A" vi-beginning-of-line 
bindkey "^E" vi-end-of-line 

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="aussiegeek"
# ZSH_THEME="bunsen"
ZSH_THEME="agnoster"
export DEFAULT_USER="yorkbai"
#ZSH_THEME="bullet-train"
#ZSH_THEME="powerline"
# setting for powerline theme
#POWERLINE_PATH="short"
#POWERLINE_NO_BLANK_LINE="true"
#POWERLINE_HIDE_HOST_NAME="true"
#POWERLINE_HIDE_USER_NAME="true"
#POWERLINE_DETECT_SSH="true"
# setting for powerline theme end

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(git osx z  brew-cask brew vi-mode zsh-syntax-highlighting extract web-search wd iwhois aws encode64 copydir) 

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
export PATH=/Users/yorkbai/bin:/Users/yorkbai/bin/dbgp:$PATH
export PYTHONSTARTUP=$HOME/.pythonrc.py
export PYTHONPATH=/Users/yorkbai/bin/dbgp/pythonlib
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

#include Z 
#. ~/bin/z.sh
#source ~/.iterm2_shell_integration.`basename $SHELL`

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
if brew command command-not-found-init > /dev/null; then eval "$(brew command-not-found-init)"; fi

alias vim='/opt/homebrew-cask/Caskroom/macvim/7.4.104/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim -v'
alias rm='trash'

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
source /Users/yorkbai/Library/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CLICOLOR=1
#sets up the color scheme for list export
export LSCOLORS="gxfxcxdxbxegedabagacad"

#display zsh command line status for vi-mode
VIMODE='-- INSERT --'
function zle-line-init zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/[INSERT]}"
    zle reset-prompt
}
zle -N zle-line-init 
zle -N zle-keymap-select
export KEYTIMEOUT=1
RPROMPT='%{$fg[green]%}${VIMODE}%{$reset_color%}'
# setting completed

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r

# Send args command for right pane
function ts {
  args=$@
  tmux send-keys -t right "$args" C-m
}

function tj {
  args=$@
  tmux send-keys -t Down "$args" C-m
}

#source ~/.oh-my-zsh/plugins/incr/incr*.zsh
source /usr/local/bin/aws_zsh_completer.sh

# Duotai proxy
alias pon='export http_proxy=http://duotai:yj3do7W0PxV@team.h.xduotai.com:16457;export https_proxy=$http_proxy' 
alias poff='unset http_proxy;unset https_proxy'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =====================  vim与命令行快速切换==============
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# =====================  stow manager config file ==============

export DOTFILES=/Users/yorkbai/workspace/useful_code/git/dotfiles

dotfiles-count() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .* | grep -v ^l | tee >(wc -l)
        popd >/dev/null 2>&1
}

dotfiles-init() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .$1*;
        mkdir -p $DOTFILES/$1;
        mv .$1* $DOTFILES/$1;
        stow --ignore ".DS_Store" --dir=$DOTFILES --target=$HOME  -vv $1
        popd >/dev/null 2>&1
}

dotfiles-rebuild() {
        stow --dir=$DOTFILES --target=$HOME  -vv $@
}
