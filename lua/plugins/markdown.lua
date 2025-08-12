return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ft = { "markdown", "Avante", "codecompanion" },
    opts = {
      file_types = { "markdown", "Avante", "codecompanion" },
      overrides = {
        buftype = {
          nofile = {
            code = {
              style = "normal",
            },
          },
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
