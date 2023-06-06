# zsh stuff.

setopt extendedglob

# oh-my-zsh stuff.

export ZSH="/Users/masonloyet/.oh-my-zsh"
export LANG=en_US.UTF-8
DISABLE_UPDATE_PROMPT="true"
plugins=(git)
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# environment vars

export EDITOR='nvim'

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Users/masonloyet/flutter/flutter/bin:$PATH"
export PATH="/usr/local/smlnj/bin:$PATH"
export PATH="/Users/masonloyet/bin/:$PATH"

# aliases

alias smlnj="rlwrap sml"
alias acl2="rlwrap saved_acl2"
alias lisp="rlwrap sbcl"

alias vim=nvim
alias f3=/Users/masonloyet/flutter/flutter3/flutter/bin/flutter

alias gap='git add --patch'

# fzf history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
