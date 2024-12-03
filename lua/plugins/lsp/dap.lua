local languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
    -- dependencies = {
    --   {
    --     "Joakker/lua-json5",
    --     build = "./install.sh",
    --   },
    -- },
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
      -- require("dap.ext.vscode").json_decode = require("json5").parse

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

      -- dap.adapters.chrome = {
      --   type = "executable",
      --   command = "google-chrome-stable",
      --   host = "localhost",
      --   port = "${port}",
      --   executable = {
      --     command = "js-debug-adapter",
      --     args = { "${port}" },
      --   },
      -- }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "williamboman/mason.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = { "js-debug-adapter" },
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
  {
    "LiadOz/nvim-dap-repl-highlights",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
}
