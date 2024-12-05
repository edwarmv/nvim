local defaults = require("config.defaults")

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VimEnter",
  opts = {
    preset = "classic",
    throttle = defaults.lsp_debounce,
  },
}
