return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "mini.icons",
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
    },
  },
}
