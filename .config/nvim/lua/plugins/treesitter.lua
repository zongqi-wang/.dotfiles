-- Treesitter configuration
-- Using main branch (master branch is frozen and incompatible with Neovim 0.12+)
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })

      -- Install parsers (max_jobs=4 to avoid concurrent build races)
      local wanted = {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
        -- Go
        'go', 'gomod', 'gosum', 'gowork',
        -- Java
        'java',
        -- TypeScript/JavaScript
        'typescript', 'javascript', 'tsx',
        -- Data formats
        'json', 'yaml', 'toml',
      }
      local installed = require('nvim-treesitter').get_installed()
      local missing = vim.tbl_filter(function(lang)
        return not vim.list_contains(installed, lang)
      end, wanted)
      if #missing > 0 then
        require('nvim-treesitter').install(missing, { max_jobs = 4 })
      end

      -- Enable treesitter highlighting and indentation for all filetypes
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      })

      -- Select keymaps
      local ts_select = require('nvim-treesitter-textobjects.select')
      local function sel(mapping, query, desc)
        vim.keymap.set({ 'x', 'o' }, mapping, function()
          ts_select.select_textobject(query, 'textobjects')
        end, { desc = desc })
      end
      sel('af', '@function.outer', 'around function')
      sel('if', '@function.inner', 'inside function')
      sel('ac', '@class.outer', 'around class')
      sel('ic', '@class.inner', 'inside class')
      sel('aa', '@parameter.outer', 'around argument')
      sel('ia', '@parameter.inner', 'inside argument')
      sel('ai', '@conditional.outer', 'around conditional')
      sel('ii', '@conditional.inner', 'inside conditional')
      sel('al', '@loop.outer', 'around loop')
      sel('il', '@loop.inner', 'inside loop')
      sel('a/', '@comment.outer', 'around comment')

      -- Move keymaps
      local move = require('nvim-treesitter-textobjects.move')
      local function move_map(mapping, fn, query, desc)
        vim.keymap.set({ 'n', 'x', 'o' }, mapping, function()
          fn(query, 'textobjects')
        end, { desc = desc })
      end
      move_map(']f', move.goto_next_start, '@function.outer', 'Next function start')
      move_map(']c', move.goto_next_start, '@class.outer', 'Next class start')
      move_map(']a', move.goto_next_start, '@parameter.inner', 'Next argument')
      move_map(']F', move.goto_next_end, '@function.outer', 'Next function end')
      move_map(']C', move.goto_next_end, '@class.outer', 'Next class end')
      move_map('[f', move.goto_previous_start, '@function.outer', 'Previous function start')
      move_map('[c', move.goto_previous_start, '@class.outer', 'Previous class start')
      move_map('[a', move.goto_previous_start, '@parameter.inner', 'Previous argument')
      move_map('[F', move.goto_previous_end, '@function.outer', 'Previous function end')
      move_map('[C', move.goto_previous_end, '@class.outer', 'Previous class end')

      -- Swap keymaps
      local swap = require('nvim-treesitter-textobjects.swap')
      vim.keymap.set('n', '<leader>a', function()
        swap.swap_next('@parameter.inner')
      end, { desc = 'Swap with next argument' })
      vim.keymap.set('n', '<leader>A', function()
        swap.swap_previous('@parameter.inner')
      end, { desc = 'Swap with previous argument' })
    end,
  },
}
