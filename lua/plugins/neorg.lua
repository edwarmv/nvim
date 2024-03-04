return {
  "nvim-neorg/neorg",
  enabled = false,
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-neorg/neorg-telescope",
      keys = {
        { "<space>tnw", "<cmd>Telescope neorg switch_workspace<cr>", desc = "Telescope - Neorg Switch Workspaces" },
      },
    },
  },
  event = "VeryLazy",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = vim.fn.has("macunix") == 1 and {
              main = "~/Library/CloudStorage/CloudMounter-EdwarMartinezVale/neorg",
              knowledge = "~/Library/CloudStorage/CloudMounter-EdwarMartinezVale/neorg/knowledge",
              work = "~/Library/CloudStorage/CloudMounter-EdwarMartinezVale/neorg/work",
            } or {
              main = "~/neorg",
              knowledge = "~/neorg/knowledge",
              work = "~/neorg/work",
            },
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.telescope"] = {},
      },
    })
  end,
}
