return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "echasnovski/mini.icons",
    },
    opts = {
      default_file_explorer = false,
      -- win_options = {
      --   signcolumn = "yes:2",
      --   number = false,
      -- },
      view_options = {
        show_hidden = true,
      },
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
