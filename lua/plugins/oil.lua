return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "echasnovski/mini.icons",
    },
    opts = {
      -- win_options = {
      --   signcolumn = "yes:2",
      --   number = false,
      -- },
      view_options = {
        show_hidden = true,
      },
      watch_for_changes = true,
    },
    keys = {
      { "<space>o", "<cmd>Oil<cr>", desc = "Oil" },
    },
  },
  -- {
  --   "refractalize/oil-git-status.nvim",
  --   dependencies = {
  --     "stevearc/oil.nvim",
  --   },
  --   opts = {},
  -- },
}
