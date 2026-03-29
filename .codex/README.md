# Codex Config

This repo only tracks the durable Codex configuration.

Tracked:
- `config.toml`

Ignored:
- auth
- history
- logs
- sqlite state
- caches
- temporary files
- bundled system skills

Note:
- `config.toml` currently includes absolute trusted-project paths for this machine.
- If you clone this setup elsewhere, review those entries before using them as-is.
