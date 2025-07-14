local defaults = require("config.defaults")

local languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

return {
  "mfussenegger/nvim-dap",
  recommended = true,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
      opts = {
        automatic_installation = false,
        ensure_installed = { "js-debug-adapter" },
        handlers = {}, -- sets up dap in the predefined manner
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle() end, desc = "Dap UI" },
          { "<leader>dU", function() require("dapui").toggle({ reset = true }) end, desc = "Dap UI - Reset layout" },
          { "<leader>de", function() require("dapui").eval(nil, { enter = true }) end, desc = "Eval", mode = { "n", "v" } },
        },
      opts = {
        floating = {
          border = defaults.border,
        },
      },
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
      end,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
  config = function()
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(require("config.defaults").icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    local dap = require("dap")

    dap.adapters.python = {
      type = "executable",
      command = "./venv/bin/python",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
  end,
}
