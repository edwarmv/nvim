return {
  {
    "sontungexpt/better-diagnostic-virtual-text",
    enabled = false,
    event = "LspAttach",
    opts = {},
  },
  {
    -- "rachartier/tiny-inline-diagnostic.nvim",
    "edwarmv/tiny-inline-diagnostic.nvim",
    enabled = true,
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
        background = "Normal",
        mixing_color = "None",
      },
      blend = {
        factor = 0.3,
      },
    },
  },
}
