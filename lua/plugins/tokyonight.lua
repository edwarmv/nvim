return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require("tokyonight.colors").setup()
    local util = require("tokyonight.util")

    require("tokyonight").setup({
      plugins = { markdown = true },
      style = "storm",
      light_style = "day",
      dim_inactive = true,
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
        -- hl.Folded = { fg = c.comment, bg = c.none }
      end,
    })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = colors.error })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = colors.warning })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = colors.info })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = colors.hint })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingOk", { fg = colors.green })

    vim.api.nvim_set_hl(0, "MasonHighlightBlock", { fg = colors.bg_dark, bg = colors.blue })
    vim.api.nvim_set_hl(0, "MasonLink", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "MasonHighlight", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "MasonHighlightBlockBold", { fg = colors.bg_dark, bg = colors.blue, bold = true })
    vim.api.nvim_set_hl(0, "MasonHighlightBlockBoldSecondary", { fg = colors.bg_dark, bg = colors.orange, bold = true })
    vim.api.nvim_set_hl(0, "MasonHighlightBlockSecondary", { fg = colors.bg_dark, bg = colors.orange })
    vim.api.nvim_set_hl(0, "MasonHighlightSecondary", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "MasonHeader", { fg = colors.bg_dark, bg = colors.orange, bold = true })
    vim.api.nvim_set_hl(0, "MasonHeaderSecondary", { fg = colors.bg_dark, bg = colors.blue, bold = true })
    vim.api.nvim_set_hl(0, "MasonError", { fg = colors.red })
    vim.api.nvim_set_hl(0, "MasonMuted", { fg = colors.comment })
    vim.api.nvim_set_hl(0, "MasonHeading", { fg = colors.fg, bold = true })
    vim.api.nvim_set_hl(0, "MasonMutedBlock", { fg = colors.bg_dark, bg = colors.comment })
    vim.api.nvim_set_hl(0, "MasonMutedBlockBold", { fg = colors.bg_dark, bg = colors.comment, bold = true })
    vim.api.nvim_set_hl(0, "MasonNormal", { fg = colors.fg })
    -- dark5 = "#737aa2",
    --  blue0 = "#3d59a1",
    --  blue = "#7aa2f7",
    --  cyan = "#7dcfff",
    --  blue1 = "#2ac3de",
    --  blue2 = "#0db9d7",
    --  blue5 = "#89ddff",
    --  blue6 = "#b4f9f8",
    --  blue7 = "#394b70",
    --  magenta = "#bb9af7",
    --  magenta2 = "#ff007c",
    --  purple = "#9d7cd8",
    --  orange = "#ff9e64",
    --  yellow = "#e0af68",
    --  green = "#9ece6a",
    --  green1 = "#73daca",
    --  green2 = "#41a6b5",
    --  teal = "#1abc9c",
    --  red = "#f7768e",
    --  red1 = "#db4b4b",

    vim.api.nvim_set_hl(0, "LeapMatch", { fg = colors.green, nocombine = true, underline = true, bold = true })
    vim.api.nvim_set_hl(
      0,
      "LeapLabelPrimary",
      { fg = colors.bg_dark, bg = colors.green, nocombine = true, bold = true }
    )
    vim.api.nvim_set_hl(
      0,
      "LeapLabelSecondary",
      { fg = colors.bg_dark, bg = colors.blue, nocombine = true, bold = true }
    )
    vim.api.nvim_set_hl(
      0,
      "LeapLabelSelected",
      { fg = colors.bg_dark, bg = colors.purple, nocombine = true, bold = true }
    )
    vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = colors.comment })

    vim.api.nvim_set_hl(0, "HopNextKey", { fg = colors.green, bg = colors.bg, bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey1", { fg = colors.green, bg = colors.bg, bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey2", { fg = colors.green, bg = colors.bg, bold = true })
    vim.api.nvim_set_hl(0, "HopPreview", { fg = colors.green, bg = colors.bg, bold = true })

    vim.api.nvim_set_hl(0, "NeoTreeMessage", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NeoTreeDimText", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NeoTreeDotfile", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { link = "FloatTitle" })
    vim.api.nvim_set_hl(0, "NeoTreeModified", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { link = "diffAdded" })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { link = "diffRemoved" })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NeoTreeGitStaged", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })

    vim.api.nvim_set_hl(0, "HydraRed", { fg = colors.red })
    vim.api.nvim_set_hl(0, "HydraBlue", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "HydraAmaranth", { fg = colors.magenta })
    vim.api.nvim_set_hl(0, "HydraTeal", { fg = colors.teal })
    vim.api.nvim_set_hl(0, "HydraPink", { fg = colors.purple })

    vim.api.nvim_set_hl(0, "NeoTreeMessage", { link = "Comment" })

    vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { link = "DiagnosticSignError" })
    vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { link = "DiagnosticSignWarn" })
    vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { link = "DiagnosticSignInfo" })
    vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { link = "DiagnosticSignHint" })
    vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", { link = "StatusLine" })

    -- vim.api.nvim_set_hl(0, "ModesCopy", { bg = utils.blend(colors.yellow, colors.bg, 0.15) })
    -- vim.api.nvim_set_hl(0, "ModesDelete", { bg = utils.blend(colors.red, colors.bg, 0.15) })
    -- vim.api.nvim_set_hl(0, "ModesInsert", { bg = utils.blend(colors.blue, colors.bg, 0.15) })
    -- vim.api.nvim_set_hl(0, "ModesVisual", { bg = utils.blend(colors.purple, colors.bg, 0.15) })

    -- vim.highlight.create("InfoFloat", { guifg = colors.blue2 }, false)
    -- vim.highlight.create("WarningFloat", { guifg = colors.yellow }, false)
    -- vim.highlight.create("ErrorFloat", { guifg = colors.red1 }, false)
    -- vim.highlight.create("HintFloat", { guifg = colors.teal }, false)

    -- vim.highlight.create("Green", { guifg = colors.green }, false)
    -- vim.highlight.create("CmpItemAbbr", { guifg = colors.comment }, false)
    -- vim.api.nvim_command("hi link LightBulbVirtualText DiagnosticHint")

    -- vim.g.VM_Mono_hl = "Cursor"
    -- vim.g.VM_Extend_hl = "Visual"
    -- vim.g.VM_Cursor_hl = "Cursor"
    -- vim.g.VM_Insert_hl = "Cursor"

    vim.cmd.colorscheme("tokyonight")
  end,
}
