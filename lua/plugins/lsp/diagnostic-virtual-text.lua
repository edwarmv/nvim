return {
  {
    "sontungexpt/better-diagnostic-virtual-text",
    enabled = false,
    event = "LspAttach",
    opts = {},
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = false,
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
    config = function(_, opts)
      require("tiny-inline-diagnostic.highlights").setup_highlights = function() end
      require("tiny-inline-diagnostic").setup(opts)
    end,
  },
  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    enabled = false,
    opts = {
      gap_size = 0,
      toggle_event = { "InsertEnter" },
    },
  },
  {
    "luozhiya/lsp-virtual-improved.nvim",
    enabled = false,
    event = { "LspAttach" },
    init = function()
      local diagnostics = {
        virtual_improved = {
          current_line = "only",
          spacing = 0,
        },
      }
      vim.diagnostic.config(diagnostics)
    end,
    opts = {},
  },
}
