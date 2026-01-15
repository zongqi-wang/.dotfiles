# Dotfiles

Personal configuration files managed with a bare git repository.

## Contents

- **nvim** - Neovim configuration (based on kickstart.nvim)
- **hypr** - Hyprland window manager, hyprlock, hyprpaper, hypridle
- **fish** - Fish shell configuration
- **waybar** - Status bar
- **dunst** - Notification daemon

## Dependencies

### Arch/CachyOS

```bash
# Core Hyprland ecosystem
sudo pacman -S hyprland hyprlock hyprpaper hypridle hyprpolkitagent

# Status bar and notifications
sudo pacman -S waybar dunst

# Application launcher
sudo pacman -S hyprlauncher wofi

# Screenshots and clipboard
sudo pacman -S grim slurp wl-clipboard cliphist

# Terminal and file manager
sudo pacman -S kitty dolphin

# Media controls and utilities
sudo pacman -S playerctl brightnessctl

# Fonts (optional)
sudo pacman -S ttf-dejavu noto-fonts

# GTK/Qt theming
sudo pacman -S adw-gtk-theme qt5ct qt6ct
```

## Setup on a New Machine

### 1. Install dependencies (see above)

### 2. Clone and checkout dotfiles

```bash
# Clone the bare repo
git clone --bare git@github.com:zongqi-wang/dotfiles.git $HOME/.dotfiles

# Define the alias for this session
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Checkout the files
dotfiles checkout

# If there are conflicts with existing files, back them up:
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} {}.backup
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no
```

### 3. Make the alias permanent

**Fish** (~/.config/fish/config.fish):
```fish
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

**Bash/Zsh** (~/.bashrc or ~/.zshrc):
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

### 4. Create screenshot directory

```bash
mkdir -p ~/Pictures/Screenshots
```

### 5. Log out and log back into Hyprland

## Hyprland Keybindings

| Key | Action |
|-----|--------|
| SUPER+Q | Terminal (kitty) |
| SUPER+R | App launcher |
| SUPER+E | File manager |
| SUPER+C | Kill window |
| SUPER+M | Exit Hyprland |
| SUPER+L | Lock screen |
| SUPER+V | Toggle floating |
| SUPER+SHIFT+V | Clipboard history |
| SUPER+F | Fullscreen |
| SUPER+SHIFT+F | Maximize |
| SUPER+S | Scratchpad |
| SUPER+1-0 | Switch workspace |
| SUPER+SHIFT+1-0 | Move window to workspace |
| SUPER+Arrow | Move focus |
| SUPER+SHIFT+Arrow | Move window |
| SUPER+CTRL+Arrow | Resize window |
| Print | Screenshot (full) |
| SUPER+Print | Screenshot (region) |
| SUPER+SHIFT+Print | Screenshot (window) |

## Usage

```bash
dotfiles status              # Check status
dotfiles add <file>          # Track a new file
dotfiles commit -m "msg"     # Commit changes
dotfiles push                # Push to remote
dotfiles diff                # View changes
```
