return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = true,
    },
  },
  enabled = true,
  opts = {
    window = {
      width = 0.85,
    },
  },
  keys = {
    { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
