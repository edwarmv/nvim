local defaults = require("config.defaults")

return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "folke/lazydev.nvim",
    "rafamadriz/friendly-snippets",
  },
  version = "v0.*",
  opts = {
    keymap = { preset = "super-tab" },
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
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = defaults.lsp_debounce,
      },
      list = {
        max_items = 6,
      },
    },
  },
  opts_extend = { "sources.default" },
}
