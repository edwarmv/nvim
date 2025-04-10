return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    opts = {
      file_types = { "markdown", "Avante" },
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
