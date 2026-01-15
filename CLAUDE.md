# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a bare git repository for managing dotfiles. The repo lives at `~/.dotfiles` with the work-tree set to `$HOME`.

**Tracked configurations:**
- `.config/nvim/` - Neovim (Lua-based, uses lazy.nvim)
- `.config/hypr/` - Hyprland window manager
- `.config/fish/` - Fish shell

## Working with This Repo

Use the `dotfiles` alias instead of `git`:

```bash
dotfiles status
dotfiles add ~/.config/someapp/config
dotfiles commit -m "Add someapp config"
dotfiles push
```

Or use the full command:
```bash
git --git-dir=$HOME/.dotfiles --work-tree=$HOME <command>
```

## Configuration Notes

### Hyprland
- Monitor: 4K OLED at 240Hz with VRR
- Terminal: kitty
- Launcher: hyprlauncher
- Main modifier: SUPER key
- Test changes: `hyprctl reload`

### Neovim
- Plugin manager: lazy.nvim
- LSP, treesitter, telescope configured
- Run `:checkhealth` to verify setup

### Fish
- Sources CachyOS fish config
- Local binaries in `~/.local/bin`
