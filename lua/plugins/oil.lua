return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "echasnovski/mini.icons",
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
