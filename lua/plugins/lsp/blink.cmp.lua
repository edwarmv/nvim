return {
  "saghen/blink.cmp",
  enabled = true,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "folke/lazydev.nvim",
    "L3MON4D3/LuaSnip",
  },
  build = "cargo build --release",
  -- version = "*",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<M-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
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
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        lua = { "lsp", "path", "snippets", "buffer", "lazydev" },
      },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        lsp = {
          opts = { tailwind_color_icon = "■" },
          fallbacks = {},
        },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        max_height = 6,
      },
    },
  },
}
