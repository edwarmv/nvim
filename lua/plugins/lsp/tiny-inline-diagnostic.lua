local defaults = require("config.defaults")

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  event = "VimEnter",
  opts = {
    preset = "modern",
    throttle = defaults.lsp_debounce,
  },
}
