return {
  "NeogitOrg/neogit",
  branch = "nightly",
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
    auto_show_console = false,
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
