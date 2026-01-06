# My Shell Configurations

My shell configurations for Bash and Zsh.

## Usage

To use these configurations, clone the repo into `~/.config/shell`. It must be
exactly this path as the common config file is sourced from there.

### Bash

Add the following line to your `~/.bashrc` file:

```bash
[[ -r "$HOME/.config/shell/bashrc" ]] && . "$HOME/.config/shell/bashrc"
```

### Zsh

Add the following line to your `~/.zshrc` file:

```zsh
[[ -r "$HOME/.config/shell/zshrc" ]] && . "$HOME/.config/shell/zshrc"
```

If using Oh-My-Zsh, add the above after the Oh-My-Zsh settings to prevent settings
to be overwritten.
