local defaults = require("config.defaults")

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      enabled = true,
      view_search = false,
    },
    -- cmdline = {
    --   view = "cmdline",
    -- },
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
        border = {
          style = defaults.border,
        },
        size = {
          min_width = 0,
          width = "50%",
          height = "auto",
        },
      },
      popup = {
        border = {
          style = defaults.border,
        },
        size = {
          width = "50%",
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
      -- mini = {
      --   win_options = {
      --     winblend = 0,
      --   },
      -- },
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
