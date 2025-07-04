local defaults = require("config.defaults")

return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "LspAttach",
  opts = {
    picker = {
      "buffer",
      opts = {
        hotkeys = true,
        winborder = defaults.border,
        hotkeys_mode = "text_diff_based",
      },
    },
  },
}
