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
        automatic_installation = true,
        ensure_installed = { "js-debug-adapter", "python" },
        handlers = {}, -- sets up dap in the predefined manner
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<space>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<space>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
      opts = {},
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
    {
      "LiadOz/nvim-dap-repl-highlights",
      dependencies = "nvim-treesitter/nvim-treesitter",
      opts = {},
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },
  -- stylua: ignore
  keys = {
    { "<space>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<space>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<space>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<space>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<space>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<space>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<space>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<space>dj", function() require("dap").down() end, desc = "Down" },
    { "<space>dk", function() require("dap").up() end, desc = "Up" },
    { "<space>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<space>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<space>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<space>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<space>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<space>ds", function() require("dap").session() end, desc = "Session" },
    { "<space>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<space>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
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

    dap.adapters.debugpy = {
      type = "executable",
      command = "./venv/bin/python",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
  end,
}
