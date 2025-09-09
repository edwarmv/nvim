local defaults = require("config.defaults")

return {
  "saghen/blink.cmp",
  branch = "rework-frecency",
  enabled = true,
  lazy = true, -- lazy loading handled internally
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  -- version = "*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = {
        "select_and_accept",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      -- ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      ["<C-space>"] = {
        function(cmp)
          cmp.show({ providers = { "lsp", "path", "snippets", "buffer" } })
        end,
      },
      ["<M-space>"] = {
        "show_documentation",
        "hide_documentation",
      },
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
      },
    },
    snippets = { preset = "luasnip" },
    completion = {
      documentation = {
        auto_show_delay_ms = 200,
        auto_show = true,
        window = {
          border = "none",
        },
      },
      trigger = {
        show_on_backspace = true,
      },
      menu = {
        max_height = 6,
        border = "none",
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    signature = {
      enabled = false,
      window = {
        border = defaults.border,
      },
    },
    fuzzy = {
      implementation = "rust",
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
  },
}
