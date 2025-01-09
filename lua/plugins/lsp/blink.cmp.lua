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
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
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
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          winhighlight = "Normal:Pmenu,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        },
      },
      menu = {
        max_height = 6,
        winhighlight = "Normal:Pmenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:PmenuSel,Search:None",
      },
    },
  },
}
