-- File explorer configuration
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle [E]xplorer', silent = true },
      { '<leader>ge', ':Neotree git_status<CR>', desc = '[G]it [E]xplorer', silent = true },
      { '<leader>be', ':Neotree buffers<CR>', desc = '[B]uffer [E]xplorer', silent = true },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
        },
        modified = {
          symbol = '●',
        },
        git_status = {
          symbols = {
            added = '',
            modified = '',
            deleted = '✖',
            renamed = '󰁕',
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      },
      window = {
        position = 'left',
        width = 35,
        mappings = {
          ['\\'] = 'close_window',
          ['<space>'] = 'none',
          ['<cr>'] = 'open',
          ['o'] = 'open',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['C'] = 'close_node',
          ['z'] = 'close_all_nodes',
          ['Z'] = 'expand_all_nodes',
          ['a'] = { 'add', config = { show_path = 'relative' } },
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy',
          ['m'] = 'move',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.git',
            '.DS_Store',
            'thumbs.db',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true,
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['f'] = 'filter_on_submit',
            ['<C-x>'] = 'clear_filter',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = true,
      },
      git_status = {
        window = {
          position = 'float',
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          local arg = vim.fn.argv(0)
          if arg ~= '' and vim.fn.isdirectory(arg) == 1 then
            vim.cmd('Neotree show')
          end
        end,
      })
    end,
  },
}
