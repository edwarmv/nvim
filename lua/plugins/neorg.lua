return {
  "nvim-neorg/neorg",
  enabled = false,
  dependencies = {
    "luarocks.nvim",
    {
      "nvim-neorg/neorg-telescope",
      keys = {
        { "<space>tn", "<cmd>Telescope neorg switch_workspace<cr>", desc = "Telescope - Neorg Switch Workspaces" },
      },
    },
  },
  lazy = false,
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
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
        -- ["core.integrations.telescope"] = {},
      },
    })
  end,
  keys = {
    { "<space>n", "<cmd>Neorg index<cr>", desc = "Neorg" },
    { "<space>N", "<cmd>Neorg return<cr>", desc = "Neorg - Return" },
  },
}
