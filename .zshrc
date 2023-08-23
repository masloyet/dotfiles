# zsh stuff.

setopt extendedglob

# oh-my-zsh stuff.

export ZSH="<home>/.oh-my-zsh"
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

# fzf history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
