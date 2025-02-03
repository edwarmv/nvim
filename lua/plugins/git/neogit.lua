return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
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
    integrations = {
      diffview = false,
    },
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
        require("neogit").open({ cwd = "%:p:h" })
      end,
      desc = "[Neogit] - Open Relative",
    },
  },
}
