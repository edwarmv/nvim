return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  opts = {
    disable_signs = true,
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "▸", "▾" },
      item = { "▸", "▾" },
      section = { "▸", "▾" },
    },
    auto_show_console = true,
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
