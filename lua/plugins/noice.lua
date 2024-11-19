local defaults = require("config.defaults")

return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "ibhagwan/fzf-lua",
    -- "rcarriga/nvim-notify",
  },
  enabled = true,
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
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "deprecated" },
          },
        },
        opts = { skip = true },
      },
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
      --     any = {
      --       { find = "No signature help available" },
      --       { find = "No information available" },
      --       { find = "WARNING: vim.treesitter.get_parser will return nil instead of raising an error in Neovim 0.12" },
      --       { find = "No parser for the given buffer." },
      --     },
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
  },
  keys = {
    { "<space>fn", "<cmd>NoiceFzf<cr>", desc = "FZF - Noice Messages" },
    -- { "<space>tn", "<cmd>Noice telescope<cr>", desc = "Telescope - Noice Messages" },
  },
}
