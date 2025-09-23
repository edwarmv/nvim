return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        strategies = {
          chat = {
            adapter = "gpt-oss",
            keymaps = {
              clear = {
                modes = {
                  n = "gX",
                },
                index = 6,
                callback = "keymaps.clear",
                description = "Clear Chat",
              },
            },
          },
          inline = {
            adapter = "gemini",
          },
        },
        adapters = {
          http = {
            ["gpt-oss"] = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url = "http://localhost:1234", -- optional: default value is ollama url http://127.0.0.1:11434
                  chat_url = "/v1/chat/completions", -- optional: default value, override if different
                  models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
                },
                schema = {
                  model = {
                    default = "openai/gpt-oss-20b", -- define llm model to be used
                  },
                },
              })
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Toggle" },
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
      { "<leader>cA", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "CodeCompanion Add" },
    },
  },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- "nvim-telescope/telescope.nvim", -- Optional: For WtfGrepHistory
    },
    opts = {
      provider = "openai",
      providers = {
        openai = {
          url = "http://localhost:1234/v1/chat/completions",
          model_id = "openai/gpt-oss-20b",
        },
      },
    },
    keys = {
      {
        "<leader>wd",
        mode = { "n", "x" },
        function()
          require("wtf").diagnose()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        "<leader>wf",
        mode = { "n", "x" },
        function()
          require("wtf").fix()
        end,
        desc = "Fix diagnostic with AI",
      },
      {
        mode = { "n" },
        "<leader>ws",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
      {
        mode = { "n" },
        "<leader>wp",
        function()
          require("wtf").pick_provider()
        end,
        desc = "Pick provider",
      },
      {
        mode = { "n" },
        "<leader>wh",
        function()
          require("wtf").history()
        end,
        desc = "Populate the quickfix list with previous chat history",
      },
      -- {
      --   mode = { "n" },
      --   "<leader>wg",
      --   function()
      --     require("wtf").grep_history()
      --   end,
      --   desc = "Grep previous chat history with Telescope",
      -- },
    },
  },
  {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      provider = "gpt-oss",
      providers = {
        ["gpt-oss"] = {
          __inherited_from = "openai",
          endpoint = "http://localhost:1234/v1",
          model = "openai/gpt-oss-20b",
          extra_request_body = {
            max_completion_tokens = 131072,
            max_tokens = 131072,
          },
        },
      },
      selection = {
        enabled = false,
      },
    },
    build = "make",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
}
