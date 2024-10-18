local defaults = require("config.defaults")

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
        sign = false,
        debounce = defaults.lsp_debounce,
      },
      symbol_in_winbar = {
        enable = false,
        show_file = false,
      },
      rename = {
        in_select = true,
        keys = {
          quit = "q",
        },
      },
      diagnostic = {
        diagnostic_only_current = false,
      },
      finder = {
        default = "ref+def+imp+tyd",
        keys = {
          vsplit = "v",
          split = "s",
        },
        methods = {
          tyd = "textDocument/typeDefinition",
        },
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
