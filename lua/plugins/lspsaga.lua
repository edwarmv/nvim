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
      diagnostic = {
        show_code_action = false,
        diagnostic_only_current = false,
      },
      finder = {
        default = "ref+def+imp",
      },
      hover = {
        max_width = 0.5,
        max_height = 0.5,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
