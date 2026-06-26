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
export PATH="/home/mloyet/.local/bin/:$PATH"

# aliases

alias vim=nvim
alias gap='git add --patch'
alias ls='ls --color=auto'
alias b='meson compile -C build'
alias t='meson test -C build'

# fzf history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# always tmux (but not recursive)

if [[ -n "$SSH_CONNECTION" && -z "$TMUX" ]]; then
  tmux attach
  exit
fi
