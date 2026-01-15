# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration forked from Kickstart.nvim, optimized for Go, Java, and TypeScript development. Uses lazy.nvim for plugin management.

Repository: https://github.com/zongqi-wang/nvim

## Key Commands

**Plugin Management:**
- `:Lazy` - View plugin status, install, update
- `:Mason` - Manage LSP servers, formatters, linters

**Diagnostics:**
- `:checkhealth` - Run all health checks
- `:checkhealth kickstart` - Check kickstart-specific requirements
- `:ConformInfo` - Show formatter configuration

## Keymaps

**File Explorer (Neo-tree):**
- `\` - Reveal current file / close neo-tree
- `<leader>e` - Toggle file explorer
- `<leader>ge` - Git status explorer
- `<leader>be` - Buffer explorer

**Search (Telescope):**
- `<leader><leader>` - Find files
- `<leader>sf` - Search files
- `<leader>sg` - Search by grep (live)
- `<leader>sw` - Search current word
- `<leader>sd` - Search diagnostics
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader>sn` - Search Neovim config files
- `<leader>/` - Fuzzy search in current buffer
- `<leader>s/` - Search in open files

**LSP:**
- `grn` - Rename symbol
- `gra` - Code action
- `grr` - Go to references
- `gri` - Go to implementation
- `grd` - Go to definition
- `grD` - Go to declaration
- `grt` - Go to type definition
- `gO` - Document symbols
- `gW` - Workspace symbols
- `<leader>th` - Toggle inlay hints

**Git (gitsigns):**
- `]c` / `[c` - Next/prev git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff against index
- `<leader>hD` - Diff against last commit
- `<leader>tb` - Toggle blame line
- `<leader>tg` - Toggle Lazygit

**Terminal (toggleterm):**
- `<C-\>` - Toggle terminal
- `<leader>tt` - Toggle horizontal terminal
- `<leader>tv` - Toggle vertical terminal
- `<leader>tf` - Toggle floating terminal
- `<leader>tg` - Toggle Lazygit

**Debugging:**
- `<F5>` - Start/Continue
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<F7>` - Toggle DAP UI
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint

**General:**
- `<Esc>` - Clear search highlights
- `<leader>q` - Open diagnostic quickfix list
- `<C-h/j/k/l>` - Window navigation

## Architecture

```
init.lua                    # Bootstrap: leader keys, lazy.nvim setup
lua/
  options.lua               # Vim options (numbers, splits, etc.)
  keymaps.lua               # Basic keymaps (window nav, etc.)
  autocmds.lua              # Autocommands (yank highlight, etc.)
  kickstart/
    health.lua              # Health checks (:checkhealth kickstart)
  plugins/
    lsp.lua                 # LSP, Mason, tool installer
    completion.lua          # blink.cmp, LuaSnip, friendly-snippets
    formatting.lua          # conform.nvim (format on save)
    linting.lua             # nvim-lint
    treesitter.lua          # Syntax highlighting
    telescope.lua           # Fuzzy finder
    ui.lua                  # Colorscheme, which-key, todo-comments
    editor.lua              # mini.nvim, autopairs, indent guides
    git.lua                 # gitsigns
    debug.lua               # nvim-dap (Go/JS/Java debugging)
    neo-tree.lua            # File explorer
    terminal.lua            # toggleterm.nvim, lazygit integration
```

## Adding a New Plugin

Create a new file in `lua/plugins/` or add to an existing file. Each file returns a table of plugin specs:

```lua
return {
  {
    'author/plugin-name',
    opts = { ... },
  },
}
```

## Language Configuration

- **LSP servers**: `lua/plugins/lsp.lua` in the `servers` table
- **Formatters**: `lua/plugins/formatting.lua` in `formatters_by_ft`
- **Linters**: `lua/plugins/linting.lua` in `linters_by_ft`
- **Treesitter**: `lua/plugins/treesitter.lua` in `ensure_installed`
- **Debug adapters**: `lua/plugins/debug.lua`

## Code Style

Uses stylua: 2-space indent, 160 column width, single quotes, Unix line endings.
