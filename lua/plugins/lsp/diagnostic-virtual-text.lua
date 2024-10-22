return {
  {
    "sontungexpt/better-diagnostic-virtual-text",
    enabled = false,
    event = "LspAttach",
    opts = {},
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = true,
    opts = {
      signs = {
        left = " ",
        right = " ",
        arrow = "    ",
        up_arrow = "    ",
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
      vim.api.nvim_create_autocmd("InsertEnter", {
        pattern = "*",
        callback = function()
          require("tiny-inline-diagnostic").disable()
        end,
      })
      vim.api.nvim_create_autocmd("InsertLeave", {
        pattern = "*",
        callback = function()
          require("tiny-inline-diagnostic").enable()
        end,
      })
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
