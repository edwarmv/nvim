local defaults = require("config.defaults")

return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = defaults.border,
      },
      lightbulb = {
        enable = false,
        sign = false,
        virtual_text = true,
        debounce = defaults.lsp_debounce,
      },
      symbol_in_winbar = {
        enable = false,
        show_file = false,
      },
      rename = {
        in_select = true,
        keys = {
          quit = "<c-c>",
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
}
