return {
  {
    "sontungexpt/better-diagnostic-virtual-text",
    enabled = false,
    event = "LspAttach",
    opts = {},
  },
  {
    -- "rachartier/tiny-inline-diagnostic.nvim",
    "edwarmv/tiny-inline-diagnostic.nvim",
    enabled = true,
    opts = {
      signs = {
        left = " ",
        right = " ",
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic.highlights").setup_highlights = function() end
      require("tiny-inline-diagnostic").setup(opts)
    end,
  },
}
