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
      CmpKitDeprecated = { link = "CmpItemAbbrDeprecated" },
      CmpKitCompletionItemLabel = { link = "CmpItemAbbr" },
      CmpKitCompletionItemDescription = { link = "CmpItemMenu" },
      CmpKitCompletionItemMatch = { link = "CmpItemAbbrMatch" },
      CmpKitCompletionItemExtra = { link = "CmpItemMenu" },
    },
  },
}
