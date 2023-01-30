
# Path to your oh-my-zsh installation.
export ZSH="/Users/masonloyet/.oh-my-zsh"

export LANG=en_US.UTF-8
DISABLE_UPDATE_PROMPT="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_THEME="robbyrussell"

export EDITOR='nvim'

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Users/masonloyet/flutter/flutter/bin:$PATH"
export PATH="/usr/local/smlnj/bin:$PATH"
export PATH="~/bin/:$PATH"

alias smlnj="rlwrap sml"
alias acl2="rlwrap saved_acl2"
alias lisp="rlwrap sbcl"

alias vim=nvim
alias f3=/Users/masonloyet/flutter/flutter3/flutter/bin/flutter

alias gap='git add --patch'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
