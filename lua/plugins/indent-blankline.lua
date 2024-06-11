return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    exclude = {
      filetypes = {
        "help",
        "sagahover",
        "floaterm",
        "toggleterm",
        "plaintext",
        "packer",
        "dbout",
        "NvimTree",
        "TelescopePrompt",
        "TelescopeResults",
        "",
        "neo-tree",
        "neo-tree-popup",
        "aerial",
        "mason",
        "null-ls-info",
        "noice",
        "git",
        "lazy",
        "checkhealth",
        "notify",
        "Navbuddy",
        "dashboard",
        "diff",
      },
      buftypes = {
        "terminal",
        "floaterm",
        "help",
        "quickfix",
        "nofile",
        -- "",
        --"nofile"
      },
    },
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = {
      enabled = true,
      char = "▏", -- ▎
      show_start = false,
      show_end = false,
    },
  },
}
