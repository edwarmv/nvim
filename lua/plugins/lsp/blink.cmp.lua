local defaults = require("config.defaults")

return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  enabled = true,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = {
      kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          opts = { tailwind_color_icon = "" },
          fallbacks = {},
        },
        snippets = {
          opts = {
            extended_filetypes = {
              typescript = { "javascript" },
              astro = { "javascript" },
            },
          },
        },
        buffer = {
          max_items = 5,
        },
      },
    },
    completion = {
      documentation = {
        auto_show_delay_ms = 200,
        auto_show = true,
        window = {
          border = "padded",
        },
      },
      trigger = {
        show_on_backspace = true,
        show_on_backspace_in_keyword = true,
      },
      menu = {
        border = "none",
        draw = {
          padding = 1,
          treesitter = { "lsp" },
        },
      },
      list = {
        selection = {
          auto_insert = false,
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = defaults.border,
      },
    },
    cmdline = {
      enabled = false,
    },
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "kind",
        "sort_text",
        "label",
      },
    },
  },
}
