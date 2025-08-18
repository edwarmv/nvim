local defaults = require("config.defaults")

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VimEnter",
  opts = {
    preset = "simple",
    options = {
      throttle = defaults.lsp_debounce,
      use_icons_from_diagnostic = true,
    },
  },
}
