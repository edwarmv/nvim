return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      enabled = true,
      view_search = false,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
        silent = true,
      },
      signature = {
        enabled = false,
      },
    },
    views = {
      split = {
        enter = true,
      },
      cmdline_popup = {
        size = {
          min_width = 0,
          width = "40%",
          height = "auto",
        },
      },
      popup = {
        size = {
          width = "50%",
          height = "auto",
        },
      },
      confirm = {},
      hover = {
        border = {
          padding = { 0, 0 },
        },
      },
      -- mini = {
      --   win_options = {
      --     winblend = 0,
      --   },
      -- },
    },
    routes = {
      -- {
      --   filter = {
      --     event = "notify",
      --     kind = "warn",
      --   },
      --   opts = { skip = true },
      -- },
      {
        filter = {
          event = "msg_show",
          kind = "lua_error",
        },
        opts = { skip = true },
      },
      -- {
      --   filter = {
      --     event = "msg_show",
      --     any = {
      --       { find = "deprecated" },
      --     },
      --   },
      --   opts = { skip = true },
      -- },
      -- {
      --   filter = {
      --     event = "msg_show",
      --     kind = "",
      --   },
      --   opts = { skip = true },
      -- },
      -- {
      --   filter = {
      --     event = "notify",
      --     kind = "warn",
      --     cond = function(message)
      --       return message.opts.title == "Neogit"
      --     end,
      --   },
      --   opts = { skip = true },
      -- },
    },
    presets = {
      long_message_to_split = true,
      bottom_search = true,
    },
  },
}
