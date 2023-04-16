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
          width = "40%",
          height = "auto",
        },
      },
      popup = {
        border = {
          style = "single",
        },
        size = {
          width = "70%",
          height = "70%",
        },
      },
      confirm = {
        border = {
          style = "single",
        },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          min_height = 3,
        },
        view = "split",
      },
    },
  },
}
