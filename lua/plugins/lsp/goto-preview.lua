local defaults = require("config.defaults")

return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  event = "LspAttach",
  opts = {
    width = math.floor(vim.o.columns / 2), -- Width of the floating window
    height = math.floor(vim.o.lines / 2), -- Height of the floating window
    default_mappings = false, -- Bind default mappings
    border = defaults.border,
    post_open_hook = function()
      vim.api.nvim_win_set_config(0, {
        width = math.floor(vim.o.columns / 2), -- Width of the floating window
        height = math.floor(vim.o.lines / 2), -- Height of the floating window
      })
    end,
  },
}
