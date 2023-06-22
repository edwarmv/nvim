return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      filetype_exclude = { "notify", "noice", "cmp_menu", "cmp_docs" },
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
    },
    {
      "Z",
      mode = { "o", "x" },
      function()
        require("flash").treesitter()
      end,
    },
  },
}
