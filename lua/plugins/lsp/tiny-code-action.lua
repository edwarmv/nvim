local defaults = require("config.defaults")

return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "LspAttach",
  opts = {
    picker = {
      "buffer",
      opts = {
        hotkeys = true,
        hotkeys_mode = "hotkeys_mode",
        winborder = defaults.border,
      },
    },
  },
}
