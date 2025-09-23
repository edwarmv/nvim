return {
  "rose-pine/neovim",
  enabled = true,
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  opts = {
    dim_inactive_windows = true,
    highlight_groups = {
      ExtraWhitespace = { fg = "love", bg = "love", blend = 20 },
      ["@markup.link.label"] = {},
      LuasnipInsertNodePassive = { bg = "gold", blend = 20 },
      LuasnipChoiceNodePassive = { bg = "gold", blend = 20 },
      BlinkCmpDocBorder = { fg = "highlight_high", bg = "highlight_lok" },
      BufferLineTabSelected = { fg = "text", bg = "base" },
    },
  },
}
