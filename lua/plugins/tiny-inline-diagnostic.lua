return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  event = "LspAttach",
  opts = {
    signs = {
      left = " ",
      right = " ",
    },
    hi = {
      error = "DiagnosticVirtualTextError",
      warn = "DiagnosticVirtualTextWarn",
      info = "DiagnosticVirtualTextInfo",
      hint = "DiagnosticVirtualTextHint",
      arrow = "NonText",
      background = "Normal", -- Can be a highlight or a hexadecimal color (#RRGGBB)
      mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
    },
  },
}
