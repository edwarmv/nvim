return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    statuscolumn = {
      enabled = false,
      folds = {
        open = true,
        git_hl = true,
      },
    },
    bigfile = {},
    notifier = {},
    quickfile = {},
    input = {},
    zen = {},
    rename = {},
    scratch = {},
    lazygit = {},
  },
  keys = {
    {
      "<leader>gl",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
  },
}
