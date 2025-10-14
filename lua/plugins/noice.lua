return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      view_search = false,
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
    presets = {
      command_palette = false,
      long_message_to_split = true,
      bottom_search = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "lua_error",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "deprecated" },
          },
        },
        opts = { skip = true },
      },
    },
  },
}
