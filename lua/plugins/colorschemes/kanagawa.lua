return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    compile = true,
    overrides = function(colors)
      local color = require("kanagawa.lib.color")
      local theme = colors.theme

      return {
        ExtraWhitespace = { bg = color(theme.ui.bg):blend(theme.term[2], 0.15):to_hex(), fg = theme.term[2] },
        ["@markup.link"] = { link = "Special" },
        htmlLink = { link = "Special" },
        FlashBackdrop = { fg = theme.syn.comment },
      }
    end,
  },
}
