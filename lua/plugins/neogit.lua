return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    -- "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  enabled = true,
  opts = {
    disable_signs = true,
    signs = {
      hunk = { "▸", "▾" },
      item = { "▸", "▾" },
      section = { "▸", "▾" },
    },
    graph_style = "unicode",
  },
  keys = {
    {
      "<leader>n",
      function()
        require("neogit").open()
      end,
      desc = "[Neogit] - Open",
    },
    {
      "<leader>N",
      function()
        require("neogit").open({ cwd = "%:p:h" })
      end,
      desc = "[Neogit] - Open Relative",
    },
  },
}
