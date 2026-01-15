-- Terminal configuration
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-\\>', desc = 'Toggle terminal' },
      { '<leader>tt', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]oggle [T]erminal (horizontal)' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<cr>', desc = '[T]oggle [V]ertical terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]oggle [F]loating terminal' },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'horizontal',
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 3,
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- Terminal keymaps (escape to normal mode)
      function _G.set_terminal_keymaps()
        local kopts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], kopts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], kopts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], kopts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], kopts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], kopts)
      end

      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

      -- Lazygit terminal
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
      }

      function _G.lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<leader>tg', '<cmd>lua lazygit_toggle()<CR>', { desc = '[T]oggle Lazy[g]it' })
    end,
  },
}
