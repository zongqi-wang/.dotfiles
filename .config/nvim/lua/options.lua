-- Options configuration
-- See `:help vim.o` and `:help option-list`

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse and clipboard
vim.o.mouse = 'a'
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true

-- Undo
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.showmode = false
vim.o.cursorline = true
vim.o.scrolloff = 10

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.o.inccommand = 'split'

-- Confirm before closing unsaved buffers
vim.o.confirm = true
