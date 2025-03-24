return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require("tokyonight.colors").setup()
    local util = require("tokyonight.util")

    require("tokyonight").setup({
      plugins = { markdown = true },
      style = "storm",
      light_style = "day",
      lualine_bold = true,
      on_highlights = function(hl, c)
        hl.TabLineFill = {
          bg = c.bg_dark,
        }
        -- hl.NormalFloat = {
        --   fg = c.fg,
        --   bg = c.bg,
        -- }
        hl.InclineNormal = {
          fg = c.blue,
          bg = util.blend(c.blue, 0.15, c.bg),
        }
        hl.InclineNormalNC = {
          fg = c.blue0,
          bg = util.blend(c.blue0, 0.15, c.bg),
        }
        -- hl.WhichKeyFloat = {
        --   fg = c.fg,
        --   bg = c.bg,
        -- }
        hl.ExtraWhitespace = {
          fg = c.red,
          bg = util.blend(c.red, 0.15, c.bg),
        }
        hl.CmpBorder = {
          fg = c.fg,
          bg = c.bg_float,
        }
        -- hl.WinBar = {
        --   fg = c.fg_sidebar,
        --   bg = c.none,
        -- }
        -- hl.WinBarNC = {
        --   fg = c.fg_gutter,
        --   bg = c.none,
        -- }
        -- hl.CmpFloat = {
        --   fg = c.fg,
        --   bg = c.bg_float,
        -- }
        hl.CmpBorder = {
          fg = util.blend(c.fg, 0.15, c.bg_float),
          bg = c.bg_float,
        }
        hl.CmpItemAbbr = {
          fg = c.comment,
          bg = c.none,
        }
        hl.BlinkCmpLabel = {
          fg = c.comment,
          bg = c.none,
        }
        -- hl.IlluminatedWordText = {
        --   underline = true,
        -- }
        -- hl.IlluminatedWord = {
        --   underline = true,
        -- }
        -- hl.IlluminatedWordRead = {
        --   underline = true,
        -- }
        hl.TelescopeNormal = { fg = c.comment, bg = c.bg_float }
        hl.TelescopeSelection = { link = "CursorLine" }
        hl.Folded = { fg = c.comment, bg = util.blend(c.comment, 0.10, c.bg) }
      end,
    })
  end,
}
