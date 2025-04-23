return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "copilot",
    hints = { enabled = false },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-cmp", -- autocompletion for avante commands and mentions
    "echasnovski/mini.icons",
    "github/copilot.vim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
}
