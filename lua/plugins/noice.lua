return {
  "folke/noice.nvim",
  enabled = false,
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
    presets = {
      long_message_to_split = true,
      bottom_search = true,
    },
  },
}
