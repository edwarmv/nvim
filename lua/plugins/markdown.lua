return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      completion = {
        blink = { enabled = true },
      },
      file_types = { "markdown", "Avante", "codecompanion" },
      code = {
        border = "thin",
      },
      win_options = {
        conceallevel = {
          rendered = 0,
        },
      },
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
