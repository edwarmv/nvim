return {
  "nvimdev/lspsaga.nvim",
  enabled = true,
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        in_select = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
