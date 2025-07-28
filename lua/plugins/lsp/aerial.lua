local defaults = require("config.defaults")

return {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },
    attach_mode = "global",
    show_guides = true,
    float = {
      border = defaults.border,
    },
    filter_kind = false,
    nav = {
      border = defaults.border,
    },
  },
  keys = {
    { "<leader>ss", "<cmd>AerialToggle<cr>" },
    { "<leader>sn", "<cmd>AerialNavToggle<cr>" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
