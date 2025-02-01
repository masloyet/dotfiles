# zsh stuff.

setopt extendedglob

# oh-my-zsh stuff.

export ZSH="/home/mloyet/.oh-my-zsh"
export LANG=en_US.UTF-8
DISABLE_UPDATE_PROMPT="true"
plugins=(git)
ZSH_THEME="my-robby"
source $ZSH/oh-my-zsh.sh

# environment vars

export EDITOR='nvim'

# aliases

alias vim=nvim
alias gap='git add --patch'
alias ls='ls --color=auto'

# fzf history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'
