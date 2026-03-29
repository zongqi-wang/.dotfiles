source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Dotfiles management
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
