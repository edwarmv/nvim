return {
  "glepnir/dashboard-nvim",
  enabled = false,
  event = "VimEnter",
  opts = {
    theme = "hyper",
    config = {
      shortcut = {
        -- action can be a function type
        { desc = "󰊳 Lazy", group = "@property", action = "Lazy update", key = "1" },
        { desc = " Mason", group = "@constant", action = "MasonUpdate", key = "2" },
        { desc = "󰏘 Treesitter", group = "@string", action = "TSUpdate", key = "3" },
        { desc = "󰩈 Quit", group = "Error", action = "q", key = "q" },
      },
      week_header = {
        enable = true, --boolean use a week header
      },
    },
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    {
      "folke/drop.nvim",
      event = "VimEnter",
      opts = {},
    },
  },
}
