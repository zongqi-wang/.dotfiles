-- Treesitter configuration
-- Using master branch for compatibility with textobjects
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'master' },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
          -- Go
          'go',
          'gomod',
          'gosum',
          'gowork',
          -- Java
          'java',
          -- TypeScript/JavaScript
          'typescript',
          'javascript',
          'tsx',
          -- Data formats
          'json',
          'yaml',
          'toml',
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },

        -- Textobjects configuration
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'around function' },
              ['if'] = { query = '@function.inner', desc = 'inside function' },
              ['ac'] = { query = '@class.outer', desc = 'around class' },
              ['ic'] = { query = '@class.inner', desc = 'inside class' },
              ['aa'] = { query = '@parameter.outer', desc = 'around argument' },
              ['ia'] = { query = '@parameter.inner', desc = 'inside argument' },
              ['ai'] = { query = '@conditional.outer', desc = 'around conditional' },
              ['ii'] = { query = '@conditional.inner', desc = 'inside conditional' },
              ['al'] = { query = '@loop.outer', desc = 'around loop' },
              ['il'] = { query = '@loop.inner', desc = 'inside loop' },
              ['a/'] = { query = '@comment.outer', desc = 'around comment' },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = { query = '@function.outer', desc = 'Next function start' },
              [']c'] = { query = '@class.outer', desc = 'Next class start' },
              [']a'] = { query = '@parameter.inner', desc = 'Next argument' },
            },
            goto_next_end = {
              [']F'] = { query = '@function.outer', desc = 'Next function end' },
              [']C'] = { query = '@class.outer', desc = 'Next class end' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
              ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
              ['[a'] = { query = '@parameter.inner', desc = 'Previous argument' },
            },
            goto_previous_end = {
              ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
              ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = { query = '@parameter.inner', desc = 'Swap with next argument' },
            },
            swap_previous = {
              ['<leader>A'] = { query = '@parameter.inner', desc = 'Swap with previous argument' },
            },
          },
        },
      }
    end,
  },
}
