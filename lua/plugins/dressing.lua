local defaults = require("config.defaults")

return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      border = defaults.border,
      prefer_width = 0.1,
      max_width = 0.8,
      min_width = 0.1,
    },
    select = {
      enabled = true,
      backend = { "fzf_lua" },
      fzf_lua = {
        winopts = {
          height = 0.5,
          width = 0.5,
        },
      },
      builtin = {
        border = defaults.border,
        relative = "cursor",
        max_width = 0.8,
        min_width = 0.2,
        max_height = 0.25,
        min_height = 1,
        mappings = {
          ["q"] = "Close",
        },
      },
    },
  },
}
