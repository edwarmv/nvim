local defaults = require("config.defaults")

return {
  "saghen/blink.cmp",
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
      },
    },
    snippets = { preset = "mini_snippets" },
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
      },
      menu = {
        max_height = 6,
        border = "none",
        draw = {
          padding = 1,
          treesitter = { "lsp" },
        },
      },
      list = {
        selection = {
          preselect = false,
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
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "sort_text",
        "label",
        "kind",
      },
    },
  },
}
