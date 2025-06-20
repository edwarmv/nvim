return {
  "saghen/blink.cmp",
  enabled = true,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "folke/lazydev.nvim",
    "L3MON4D3/LuaSnip",
  },
  -- version = "*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<M-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
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
    snippets = {
      preset = "mini_snippets",
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
        window = {
          border = "padded",
          max_width = math.floor(vim.o.columns / 4),
        },
      },
      trigger = {
        show_on_backspace = true,
      },
      menu = {
        max_height = 6,
        border = "none",
      },
    },
    signature = { enabled = true },
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
  },
}
