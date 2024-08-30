local defaults = require("config.defaults")

return {
  "kosayoda/nvim-lightbulb",
  enabled = true,
  opts = {
    autocmd = { enabled = true, updatetime = defaults.lsp_debounce },
    sign = {
      enabled = false,
    },
    float = {
      enabled = false,
      win_opts = {
        border = "none",
        winblend = 100,
      },
    },
    virtual_text = {
      enabled = true,
    },
  },
}
