return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && yarn install",
    },
  },
}
