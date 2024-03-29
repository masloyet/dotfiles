PROMPT=''
current_time() {
   echo
}

PROMPT+="%{$fg[magenta]%}%m%{$reset_color%}"
PROMPT+=" %(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
PROMPT+=" %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=" %{$fg[white]%}%*%{$reset_color%}
$ "
