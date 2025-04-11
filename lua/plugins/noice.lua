return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      enabled = false,
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
      command_palette = true,
      inc_rename = false,
    },
  },
}
