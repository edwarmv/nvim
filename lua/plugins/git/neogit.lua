return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim",
    "lewis6991/gitsigns.nvim",
  },
  enabled = true,
  opts = {
    disable_signs = false,
    signs = {
      hunk = { "▸", "▾" },
      item = { "▸", "▾" },
      section = { "▸", "▾" },
    },
    graph_style = "unicode",
  },
  keys = {
    {
      "<leader>gn",
      function()
        require("neogit").open()
      end,
      desc = "[Neogit] - Open",
    },
    {
      "<leader>gN",
      function()
        require("neogit").open({ cwd = vim.b.gitsigns_status_dict.root })
      end,
      desc = "[Neogit] - Open Relative",
    },
  },
}
