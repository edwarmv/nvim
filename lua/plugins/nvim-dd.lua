local defaults = require("config.defaults")

return {
  "yorickpeterse/nvim-dd",
  enabled = true,
  opts = {
    timeout = defaults.lsp_debounce,
  },
}
