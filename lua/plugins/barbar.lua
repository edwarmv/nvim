local defaults = require("config.defaults")

return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    enabled = false,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    lazy = false,
    opts = {
      -- exclude_ft = { "oil", "" },
      highlight_alternate = true,
      icons = {
        button = "",
        separator_at_end = false,
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = defaults.icons.diagnostics.error },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = defaults.icons.diagnostics.warn },
          [vim.diagnostic.severity.INFO] = { enabled = true, icon = defaults.icons.diagnostics.info },
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = defaults.icons.diagnostics.hint },
        },
      },
      animation = false,
      insert_at_end = true,
    },
    keys = {
      { "<leader>b", "<cmd>BufferPick<cr>", desc = "[Buffer] Pick" },
      { "<leader>B", "<cmd>BufferPickDelete<cr>", desc = "[Buffer] Pick" },
      { "]b", "<cmd>BufferNext<cr>", desc = "[Buffer] Cycle Next" },
      { "[b", "<cmd>BufferPrevious<cr>", desc = "[Buffer] Cycle Prev" },
      { "]B", "<cmd>BufferMoveNext<cr>", desc = "[Buffer] Move Next" },
      { "[B", "<cmd>BufferMovePrevious<cr>", desc = "[Buffer] Move Prev" },
    },
  },
}
