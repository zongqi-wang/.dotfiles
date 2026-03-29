# Claude Code Config

This repo only tracks the stable Claude Code settings that are safe to publish.

Tracked:
- `settings.json`
- `settings.local.example.json`

Ignored:
- credentials
- auth state
- history
- session logs
- backups
- caches
- local machine-specific overrides

Copy `settings.local.example.json` to `settings.local.json` if you want a local override on a specific machine.
