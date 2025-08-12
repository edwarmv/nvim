return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local utils = require("catppuccin.utils.colors")
    require("catppuccin").setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "frappe",
      },
      term_colors = true,
      dim_inactive = {
        enabled = true,
      },
      custom_highlights = function(colors)
        return {
          ExtraWhitespace = { fg = colors.red, bg = utils.darken(colors.red, 0.15, colors.base) },
        }
      end,
      auto_integrations = true,
      integrations = {
        native_lsp = {
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
            ok = { "undercurl" },
          },
        },
      },
    })
  end,
}
