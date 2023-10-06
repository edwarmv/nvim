local defaults = require("config.defaults")

return {
  "folke/trouble.nvim",
  opts = {
    signs = {
      error = " ",
      warning = " ",
      hint = " ",
      information = " ",
      other = " ",
    },
    win_config = { border = defaults.border },
  },
  keys = {
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble - Loclist" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble - Quickfix" },
    { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble - LSP References" },
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble - Toggle" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble - Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble - Document Diagnostics" },
  },
}
