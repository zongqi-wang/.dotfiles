# Dotfiles

Personal configuration files managed with a bare git repository.

## Contents

- **nvim** - Neovim configuration (based on kickstart.nvim)
- **hypr** - Hyprland window manager and hypridle configs
- **fish** - Fish shell configuration

## Setup on a New Machine

```bash
# Clone the bare repo
git clone --bare git@github.com:zongqi-wang/dotfiles.git $HOME/.dotfiles

# Define the alias
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Checkout the files
dotfiles checkout

# If there are conflicts with existing files:
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} {}.backup
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no
```

## Usage

```bash
dotfiles status              # Check status
dotfiles add <file>          # Track a new file
dotfiles commit -m "msg"     # Commit changes
dotfiles push                # Push to remote
```

## Adding the Alias

**Fish** (~/.config/fish/config.fish):
```fish
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

**Bash/Zsh** (~/.bashrc or ~/.zshrc):
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```
