return {
  "nvim-neorg/neorg",
  cmd = { "Neorg" },
  ft = "norg",
  opts = {
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
      ["core.integrations.nvim-cmp"] = {},
    },
  },
  keys = {
    { "<space>n", "<cmd>Neorg index<cr>", desc = "Neorg" },
    { "<space>N", "<cmd>Neorg return<cr>", desc = "Neorg - Return" },
  },
}
