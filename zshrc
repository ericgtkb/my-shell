# Zsh only
# Assuming this repo is cloned into ~/.config/shell
# Should be sourced after oh-my-zsh

# Load common settings
[[ -r "$HOME/.config/shell/shellrc" ]] && . "$HOME/.config/shell/shellrc"

# History is in shellrc

# vim mode
bindkey -v

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
PROMPT=" %{$fg_bold[white]%}%n%{$fg[blue]%}@%{$fg_bold[yellow]%}%m"
# arrow
PROMPT+=" %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# dir
PROMPT+="%{$fg[cyan]%}%d%{$reset_color%}"
# git
PROMPT+=' $(git_prompt_info)'
# dollar sign
PROMPT+="%{$fg_bold[white]%}$%{$reset_color%} "
