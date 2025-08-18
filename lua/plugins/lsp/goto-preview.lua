local defaults = require("config.defaults")

return {
  "rmagatti/goto-preview",
  enabled = true,
  branch = "fix-lsp-handler-nvim-010",
  dependencies = { "rmagatti/logger.nvim" },
  event = "BufEnter",
  opts = {
    width = math.floor(vim.o.columns / 3), -- Width of the floating window
    height = math.floor(vim.o.lines / 4), -- Height of the floating window
    default_mappings = false, -- Bind default mappings
    border = defaults.border,
  },
}
