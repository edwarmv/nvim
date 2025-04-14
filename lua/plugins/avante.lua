return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "gemini",
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
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    "MeanderingProgrammer/render-markdown.nvim",
  },
}
