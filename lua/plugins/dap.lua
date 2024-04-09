local languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

return {
  "mfussenegger/nvim-dap",
  enabled = true,
  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<space>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<space>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
      opts = {},
      config = function(_, opts)
        -- setup dap config by VsCode launch.json file
        -- require("dap.ext.vscode").load_launchjs()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    {
      "LiadOz/nvim-dap-repl-highlights",
      opts = {},
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require("mason-nvim-dap").default_setup(config)
          end,
          python = function(config)
            require("mason-nvim-dap").default_setup(config) -- don't forget this!
          end,
        },

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
    -- {
    --   "mxsdev/nvim-dap-vscode-js",
    --   -- dependencies = {
    --   --   "microsoft/vscode-js-debug",
    --   --   -- After install, build it and rename the dist directory to out
    --   --   build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    --   --   version = "1.*",
    --   -- },
    --   config = function()
    --     ---@diagnostic disable-next-line: missing-fields
    --     require("dap-vscode-js").setup({
    --       -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    --       -- node_path = "node",
    --
    --       -- Path to vscode-js-debug installation.
    --       debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"),
    --
    --       -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
    --       debugger_cmd = { "js-debug-adapter" },
    --
    --       -- which adapters to register in nvim-dap
    --       adapters = {
    --         "chrome",
    --         "pwa-node",
    --         "pwa-chrome",
    --         "pwa-msedge",
    --         "pwa-extensionHost",
    --         "node-terminal",
    --       },
    --
    --       -- Path for file logging
    --       -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
    --
    --       -- Logging level for output to file. Set to false to disable logging.
    --       -- log_file_level = false,
    --
    --       -- Logging level for output to console. Set to false to disable console output.
    --       -- log_console_level = vim.log.levels.ERROR,
    --     })
    --   end,
    -- },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },

  -- stylua: ignore
  keys = {
    { "<space>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<space>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<space>dc", function() require("dap").continue() end, desc = "Continue" },
    {
      "<space>da",
      function()
        if vim.fn.filereadable(".vscode/launch.json") then
          local dap_vscode = require("dap.ext.vscode")
          dap_vscode.load_launchjs(nil, {
            ["pwa-node"] = languages,
            ["chrome"] = languages,
            ["pwa-chrome"] = languages,
          })
        end
        require("dap").continue()
      end,
      desc = "Run with Args",
    },
    { "<space>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<space>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<space>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<space>dj", function() require("dap").down() end, desc = "Down" },
    { "<space>dk", function() require("dap").up() end, desc = "Up" },
    { "<space>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<space>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<space>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<space>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<space>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<space>ds", function() require("dap").session() end, desc = "Session" },
    { "<space>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<space>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local dap = require("dap")
    require("dap.ext.vscode").json_decode = require("json5").parse

    local icons = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    }
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(icons) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      },
    }

    dap.adapters["pwa-chrome"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      },
    }

    for _, language in ipairs(languages) do
      dap.configurations[language] = {
        -- {
        --   type = 'pwa-node',
        --   request = 'launch',
        --   name = 'Launch JS file',
        --   program = '${file}',
        --   cwd = '${workspaceFolder}',
        -- },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          cwd = "${workspaceFolder}",
          -- NOTE: you would need to have tsx installed globally
          runtimeExecutable = "tsx",
          args = { "${file}" },
          sourceMaps = true,
          protocol = "inspector",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Run and Debug Custom Command",
          -- you need to have tsx globally or locally installed
          runtimeExecutable = "tsx",
          runtimeArgs = function()
            local input = vim.fn.input({ prompt = "Command to run: ", completion = "file" })
            print(input)
            return input
          end,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to process",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end

    require("dap.ext.vscode").load_launchjs(nil, {
      -- ["pwa-node"] = languages,
      -- ["node"] = languages,
      -- ["chrome"] = languages,
      -- ["pwa-chrome"] = languages,
      -- ["python"] = { "python" },
    })

    -- for _, language in ipairs(js_based_languages) do
    --   dap.configurations[language] = {
    --     -- Debug single nodejs files
    --     {
    --       type = "pwa-node",
    --       request = "launch",
    --       name = "Launch file",
    --       program = "${file}",
    --       cwd = vim.fn.getcwd(),
    --       sourceMaps = true,
    --     },
    --     -- Debug nodejs processes (make sure to add --inspect when you run the process)
    --     {
    --       type = "pwa-node",
    --       request = "attach",
    --       name = "Attach",
    --       processId = require("dap.utils").pick_process,
    --       cwd = vim.fn.getcwd(),
    --       sourceMaps = true,
    --     },
    --     -- Debug web applications (client side)
    --     {
    --       type = "pwa-chrome",
    --       request = "launch",
    --       name = "Launch & Debug Chrome",
    --       url = function()
    --         local co = coroutine.running()
    --         return coroutine.create(function()
    --           vim.ui.input({
    --             prompt = "Enter URL: ",
    --             default = "http://localhost:3000",
    --           }, function(url)
    --             if url == nil or url == "" then
    --               return
    --             else
    --               coroutine.resume(co, url)
    --             end
    --           end)
    --         end)
    --       end,
    --       webRoot = vim.fn.getcwd(),
    --       protocol = "inspector",
    --       sourceMaps = true,
    --       userDataDir = false,
    --     },
    --     -- Divider for the launch.json derived configs
    --     {
    --       name = "----- ↓ launch.json configs ↓ -----",
    --       type = "",
    --       request = "launch",
    --     },
    --   }
    -- end
  end,
}
