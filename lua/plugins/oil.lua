return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "refractalize/oil-git-status.nvim",
  },
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:2",
        number = false,
      },
    })
    require("oil-git-status").setup()
  end,
  keys = {
    { "<space>o", "<cmd>Oil<cr>", desc = "Oil" },
  },
}
