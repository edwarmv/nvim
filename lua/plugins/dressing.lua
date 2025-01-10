local defaults = require("config.defaults")

return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      enabled = false,
      border = defaults.border,
      prefer_width = 0.4,
      max_width = 0.8,
      min_width = 0.3,
      win_options = {
        list = false,
      },
    },
    select = {
      get_config = function(opts)
        if opts.kind == "codeaction" or opts.kind == "luasnip" then
          return {
            backend = { "builtin" },
            builtin = {
              relative = "cursor",
            },
          }
        elseif opts.prompt == "Ring history" then
          return {
            backend = { "fzf_lua" },
          }
        end

        return {
          backend = { "builtin" },
          builtin = {
            relative = "editor",
          },
        }
      end,
      enabled = true,
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
