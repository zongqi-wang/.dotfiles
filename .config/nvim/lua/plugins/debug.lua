-- Debug Adapter Protocol configuration
return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mason-org/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      -- Language-specific debuggers
      'leoluz/nvim-dap-go',
      'mxsdev/nvim-dap-vscode-js',
    },
    keys = {
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F1>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F2>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F3>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>b',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>B',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: Toggle DAP UI',
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          'delve', -- Go
          'js-debug-adapter', -- JavaScript/TypeScript
          'java-debug-adapter', -- Java
          'java-test', -- Java test runner
        },
      }

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Go debugger
      require('dap-go').setup {
        delve = {
          detached = vim.fn.has 'win32' == 0,
        },
      }

      -- JavaScript/TypeScript debugger
      require('dap-vscode-js').setup {
        debugger_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter',
        debugger_cmd = { 'js-debug-adapter' },
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      }

      -- JavaScript/TypeScript configurations
      for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
        dap.configurations[language] = {
          -- Node.js: Debug current file
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          -- Node.js: Attach to running process
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to process',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
          -- Jest: Debug tests
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Jest Tests',
            runtimeExecutable = 'node',
            runtimeArgs = {
              './node_modules/jest/bin/jest.js',
              '--runInBand',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
          },
        }
      end

      -- Java debugger configuration
      -- Note: For full Java debugging, consider using nvim-jdtls which integrates
      -- java-debug-adapter automatically. This basic config works for simple cases.
      dap.configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = 'Attach to Java process',
          hostName = 'localhost',
          port = 5005,
        },
      }
    end,
  },
}
