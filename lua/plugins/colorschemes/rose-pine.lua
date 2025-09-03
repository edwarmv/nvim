return {
  "rose-pine/neovim",
  enabled = true,
  lazy = false,
  name = "rose-pine",
  opts = {
    dim_inactive_windows = true,
    highlight_groups = {
      ExtraWhitespace = { fg = "love", bg = "love", blend = 20 },
      ["@markup.link.label"] = {},
      LuasnipInsertNodePassive = { bg = "gold", blend = 20 },
      LuasnipChoiceNodePassive = { bg = "gold", blend = 20 },
    },
  },
}
