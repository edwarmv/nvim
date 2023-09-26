local defaults = require("config.defaults")

return {
  "folke/noice.nvim",
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
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = false,
      },
      progress = {
        enabled = true,
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
  },
}
