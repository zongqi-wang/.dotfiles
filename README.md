# Dotfiles

Arch/CachyOS-focused desktop dotfiles for a Wayland setup built around Hyprland, Walker, Waybar, Ghostty, tmux, Fish, Neovim, and Wallust.

The repo is managed as a bare Git repository so the tracked files live directly in `$HOME`.

## Highlights

- Hyprland configuration split into focused modules under `.config/hypr/conf.d`
- Dynamic theming with Wallust for Hyprland, Waybar, Ghostty, Walker, and tmux
- Ghostty + tmux terminal workflow with popup and split-pane AI launchers
- Walker launcher with clipboard, calc, file, symbols, and web search providers
- Neovim setup for Go, Java, and TypeScript development

## Stack

- Window manager: Hyprland
- Launcher: Walker
- Bar: Waybar
- Notifications: SwayNC
- Terminal: Ghostty
- Multiplexer: tmux
- Shell: Fish
- Editor: Neovim
- Theming: Wallust

## Dependencies

### Core packages

```bash
sudo pacman -S \
  hyprland hyprlock hyprpaper hypridle hyprpolkitagent \
  waybar swaync walker wlogout \
  grim slurp wl-clipboard cliphist playerctl brightnessctl jq hyprpicker \
  ghostty dolphin firefox tmux fzf fish neovim git wallust \
  ttf-jetbrains-mono-nerd noto-fonts
```

### Optional tools

```bash
sudo pacman -S lazygit
```

Install one AI CLI if you want the tmux AI bindings to be useful. The helper script auto-detects `claude`, `codex`, `chatgpt`, `aichat`, or `llm`, and you can override that with `TMUX_AI_CMD`.

## Bootstrap

```bash
git clone --bare https://github.com/zongqi-wang/dotfiles.git "$HOME/.dotfiles"

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

If checkout reports conflicts, back up the existing files first:

```bash
dotfiles checkout 2>&1 | grep -E '\s+\.' | awk '{print $1}' | xargs -I{} mv {} {}.backup
dotfiles checkout
```

Make sure these directories exist on a fresh machine:

```bash
mkdir -p ~/.cache/wallust ~/.config/tmux ~/.config/walker/themes/catppuccin ~/Pictures/Screenshots
```

## Hyprland Keys

| Key | Action |
| --- | --- |
| `SUPER+Return` | Open Ghostty |
| `SUPER+Space` / `SUPER+R` | Open Walker |
| `SUPER+SHIFT+V` | Open Walker clipboard mode |
| `SUPER+E` | Open Dolphin |
| `SUPER+B` | Open Firefox |
| `SUPER+N` | Toggle SwayNC |
| `SUPER+M` | Open Wlogout |
| `SUPER+CTRL+L` | Lock screen |
| `SUPER+S` | Toggle special workspace |
| `Print` | Screenshot to file |
| `CTRL+Print` | Screenshot to clipboard |

## tmux Keys

Prefix is `Ctrl-a`.

| Key | Action |
| --- | --- |
| `prefix + f` | Fuzzy project/session switcher |
| `prefix + a` | Split pane and launch AI CLI |
| `prefix + A` | Open AI CLI in a popup |
| `prefix + |` | Vertical split in current path |
| `prefix + -` | Horizontal split in current path |
| `prefix + r` | Reload tmux config |

Set an explicit AI command if auto-detection is not enough:

```bash
export TMUX_AI_CMD=claude
```

In Fish:

```fish
set -Ux TMUX_AI_CMD claude
```

## Repo Notes

- The repo targets my personal Arch/CachyOS workstation first, so monitor and hardware-specific settings may still need adjustment on another machine.
- tmux plugins are managed through TPM. Install it at `~/.tmux/plugins/tpm` if you want automatic plugin loading.
- Wallust templates are tracked here, but the generated files live under `~/.cache/wallust`.
