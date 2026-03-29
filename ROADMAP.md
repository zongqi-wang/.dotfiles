# Dotfiles Roadmap

## Phase 1: Public Repo Baseline

- Track the missing config surface for tmux, Walker, Claude Code, and Codex.
- Add screenshots for the desktop, terminal, tmux popup AI workflow, and launcher.
- Audit every tracked file for secrets, machine-local paths, and stale references before publishing.

## Phase 2: Portability

- Split machine-specific Hyprland settings into a local override for monitors and hardware.
- Track `lazy-lock.json` in Neovim so the editor setup is reproducible.
- Replace personal startup defaults like auto-launching Firefox with optional local-only behavior.
- Separate shared Codex settings from machine-specific trusted project paths.

## Phase 3: Presentation

- Add a `screenshots/` directory and document what each image demonstrates.
- Add a short install script or bootstrap script for dependencies and first checkout.
- Tighten naming and comments so the repo reads like an intentionally maintained system, not a home backup.

## Phase 4: AI Workflow

- Add tmux screenshots that show popup and split-pane AI usage.
- Decide on a primary AI CLI and document the expected setup for `TMUX_AI_CMD`.
- Add a small helper for project bootstrapping inside tmux so AI sessions start in the right repo automatically.
