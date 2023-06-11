return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    messages = {
      enabled = true,
      view_search = false,
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = true,
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
          style = "rounded",
        },
        size = {
          min_width = 0,
          width = "50%",
          height = "auto",
        },
      },
      popup = {
        border = {
          style = "rounded",
        },
        size = {
          width = "50%",
          height = "auto",
        },
      },
      confirm = {
        relative = "editor",
        position = {
          row = "100%",
          col = 0,
        },
        size = {
          height = "auto",
          width = "100%",
        },
        border = {
          style = "none",
        },
        win_options = {
          winhighlight = {
            Normal = "NoiceCmdline",
            IncSearch = "",
            CurSearch = "",
            Search = "",
          },
        },
        format = "details",
      },
    },
    presets = {
      long_message_to_split = true,
      bottom_search = true,
    },
  },
}
