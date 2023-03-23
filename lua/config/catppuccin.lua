local ucolors = require("catppuccin.utils.colors")
local macchiato = require("catppuccin.palettes").get_palette("macchiato")
require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  integrations = {
    -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
    cmp = true,
    notify = true,
    gitsigns = true,
    treesitter = true,
    nvimtree = true,
    aerial = true,
    mason = true,
    hop = true,
    leap = true,
    telescope = true,
    semantic_tokens = true,
    markdown = true,
    illuminate = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    fidget = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
  },
  color_overrides = {},
  highlight_overrides = {
    macchiato = {
      FidgetTask = { fg = "#5b6078", bg = "#24273a" },
      NormalFloat = { bg = "#24273a" },
      FloatBorder = { bg = "#24273a" },
      NvimTreeNormal = { bg = "#24273a" },
      WhichKeyFloat = { bg = "#24273a" },
      ExtraWhitespace = { fg = macchiato.red, bg = ucolors.blend(macchiato.red, "#24273a", 0.15) },
      TelescopeNormal = { fg = "#5b6078", bg = "#24273a" },
      TelescopeSelection = { bg = "#303347" },
    },
  },
})
vim.api.nvim_command("colorscheme catppuccin")
