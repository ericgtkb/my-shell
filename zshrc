# Zsh only
# Assuming this repo is cloned into ~/.config/shell
# Should be sourced after oh-my-zsh

# Load common settings
[[ -r "$HOME/.config/shell/shellrc" ]] && . "$HOME/.config/shell/shellrc"

# History is in shellrc

# vim mode
bindkey -v
# History search in vim mode
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
# Note when a search is found type esc then n/N to navigate results
# This is different from bash where the search is just like vim
bindkey -M vicmd "n" vi-repeat-search
bindkey -M vicmd "N" vi-rev-repeat-search

# Initialize autocomplete, but only if not already initialized
if ! (compinit -C); then
  autoload -Uz compinit
  compinit
fi

# kubectl completion for zsh (if installed)
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  # completion for alias k
  compdef _kubectl k=kubectl
fi

# Prompt
# user@host
PROMPT="%{$fg_bold[white]%}%n%{$fg[blue]%}@%{$fg_bold[yellow]%}%m"
# arrow
PROMPT+=" %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# dir
PROMPT+="%{$fg[cyan]%}%~%{$reset_color%}"
# git
PROMPT+=' $(git_prompt_info)'
# dollar sign
PROMPT+="%{$fg_bold[green]%}$%{$reset_color%} "
