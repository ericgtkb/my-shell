# Bash only
# Assuming this repo is cloned into ~/.config/shell

# Load common settings
[[ -r "$HOME/.config/shell/shellrc" ]] && . "$HOME/.config/shell/shellrc"

# History
HISTCONTROL=ignoreboth

# vim mode
set -o vi

# Bash completion
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  . "/usr/local/etc/profile.d/bash_completion.sh"
elif [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
  . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# kubectl completion
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl k
fi

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export -f parse_git_branch

PS1="\[\033[1;33m\]\u@\h:\[\033[1;37m\]\w\[\033[1;36m\]\$(parse_git_branch)\[\033[1;32m\]\$\[\033[0m\] "
