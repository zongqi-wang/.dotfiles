# nvim

Personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), optimized for **Go**, **Java**, and **TypeScript** development.

## Features

- **LSP**: gopls, ts_ls, jdtls, lua_ls
- **Formatting**: goimports/gofumpt (Go), prettier (TS/JS), google-java-format (Java)
- **Linting**: golangci-lint (Go), eslint_d (TS/JS)
- **Debugging**: Delve (Go), js-debug-adapter (TS/JS), java-debug-adapter (Java)
- **Completion**: blink.cmp with LuaSnip and friendly-snippets
- **Code navigation**: Treesitter textobjects for functions, classes, arguments
- **File explorer**: Neo-tree with git status, diagnostics, and buffer views
- **Terminal**: Toggleterm with horizontal, vertical, and floating modes
- **Git**: gitsigns with keymaps, lazygit integration

## Installation

### Prerequisites

- Neovim 0.10+ (stable or nightly)
- git, make, unzip, gcc
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation), [fd](https://github.com/sharkdp/fd#installation)
- A [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal
- Clipboard tool (xclip/xsel/win32yank depending on platform)
- [lazygit](https://github.com/jesseduffield/lazygit) (optional, for git TUI)

**Language-specific:**
- Go: `go` installed
- TypeScript/JavaScript: `npm` installed
- Java: JDK installed

### Clone

```sh
# Backup existing config if needed
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/zongqi-wang/nvim.git ~/.config/nvim
```

### First Launch

```sh
nvim
```

Lazy.nvim will automatically install all plugins. Run `:Lazy` to view status.

Mason will install LSP servers and tools. Run `:Mason` to view status.

## Key Bindings

Leader key: `<Space>`

### File Explorer (Neo-tree)

| Binding | Description |
|---------|-------------|
| `\\` | Reveal current file in tree |
| `<leader>e` | Toggle file explorer |
| `<leader>ge` | Git status explorer |
| `<leader>be` | Buffer explorer |

Inside Neo-tree: `a` add file, `A` add directory, `d` delete, `r` rename, `y` copy, `x` cut, `p` paste, `?` help.

### Terminal

| Binding | Description |
|---------|-------------|
| `<C-\>` | Toggle terminal |
| `<leader>tt` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |
| `<leader>tf` | Floating terminal |
| `<leader>tg` | Lazygit (floating) |

Inside terminal: `<Esc>` to normal mode, `<C-h/j/k/l>` to navigate windows.

### Search & Navigation

| Binding | Description |
|---------|-------------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep |
| `<leader>sd` | Search diagnostics |
| `<leader><leader>` | Find buffers |
| `<leader>/` | Fuzzy search in buffer |

### LSP

| Binding | Description |
|---------|-------------|
| `grd` | Go to definition |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grn` | Rename symbol |
| `gra` | Code action |
| `<leader>f` | Format buffer |
| `<leader>th` | Toggle inlay hints |

### Debugging

| Binding | Description |
|---------|-------------|
| `F5` | Start/Continue |
| `F1` | Step into |
| `F2` | Step over |
| `F3` | Step out |
| `F7` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |

### Treesitter Textobjects

**Select** (use with `v`, `d`, `c`, `y`):

| Binding | Description |
|---------|-------------|
| `af` / `if` | Around/inside function |
| `ac` / `ic` | Around/inside class |
| `aa` / `ia` | Around/inside argument |
| `al` / `il` | Around/inside loop |
| `ai` / `ii` | Around/inside conditional |

**Move**:

| Binding | Description |
|---------|-------------|
| `]f` / `[f` | Next/previous function |
| `]c` / `[c` | Next/previous class |
| `]a` / `[a` | Next/previous argument |

**Swap**:

| Binding | Description |
|---------|-------------|
| `<leader>a` | Swap with next argument |
| `<leader>A` | Swap with previous argument |

Run `<leader>sk` to search all keymaps.

## Structure

```
init.lua                    # Bootstrap configuration
lua/
  options.lua               # Vim options
  keymaps.lua               # Basic keymaps
  autocmds.lua              # Autocommands
  kickstart/
    health.lua              # Health checks (:checkhealth kickstart)
  plugins/
    lsp.lua                 # LSP, Mason, tool installer
    completion.lua          # Completion engine
    formatting.lua          # Code formatting
    linting.lua             # Linting
    treesitter.lua          # Syntax highlighting + textobjects
    telescope.lua           # Fuzzy finder
    ui.lua                  # Colorscheme, which-key
    editor.lua              # Editor enhancements
    git.lua                 # Git integration
    debug.lua               # Debugging (Go, TS/JS, Java)
    neo-tree.lua            # File explorer
    terminal.lua            # Terminal integration
```

## Customization

Add new plugins by creating files in `lua/plugins/`. Each file should return a table of lazy.nvim plugin specs.

## Based On

[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - A starting point for Neovim configuration.
