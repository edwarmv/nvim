return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = true,
      enabled = false,
    },
  },
  enabled = true,
  opts = {
    window = {
      width = 0.9,
    },
  },
  keys = {
    { "<cr>", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
    { "<m-cr>", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
