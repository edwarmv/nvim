local defaults = require("config.defaults")

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  enabled = true,
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
    popupmenu = {
      backend = "cmp",
    },
    views = {
      split = {
        enter = true,
      },
      cmdline_popup = {
        border = {
          style = defaults.border,
        },
        size = {
          min_width = 0,
          width = "70%",
          height = "auto",
        },
      },
      popup = {
        border = {
          style = defaults.border,
        },
        size = {
          width = "70%",
          height = "auto",
        },
      },
      confirm = {
        border = {
          style = defaults.border,
        },
      },
      hover = {
        border = {
          padding = { 0, 0 },
        },
      },
    },
    presets = {
      long_message_to_split = true,
      bottom_search = true,
      command_palette = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    routes = {
      {
        -- avoid annoying message
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
    },
  },
}
