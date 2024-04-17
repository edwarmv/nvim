return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "refractalize/oil-git-status.nvim" },
  },
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "auto:2",
      },
    })
    require("oil-git-status").setup()
  end,
}
