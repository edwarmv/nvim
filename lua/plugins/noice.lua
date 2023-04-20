return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    messages = {
      enabled = true,
    },
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    popupmenu = {
      backend = "cmp",
    },
    views = {
      split = {
        enter = true,
      },
      cmdline_popup = {
        border = {
          style = "single",
        },
        size = {
          min_width = 0,
          width = "50%",
          height = "auto",
        },
      },
      popup = {
        border = {
          style = "single",
        },
        size = {
          width = "50%",
          height = "auto",
        },
      },
      confirm = {
        border = {
          style = "single",
        },
        size = {
          width = "50%",
          height = "auto",
        },
        format = "details",
      },
    },
    presets = {
      long_message_to_split = true,
    },
  },
}
