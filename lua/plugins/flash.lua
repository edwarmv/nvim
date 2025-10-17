return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "Z",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "<c-s-s>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({ continue = true })
      end,
      desc = "Flash - Continue last search",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<leader>k",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = false, wrap = false, mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^\\s*\\zs\\S",
        })
      end,
      desc = "Jump to a line",
    },
    {
      "<leader>j",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = true, wrap = false, mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^\\s*\\zs\\S",
        })
      end,
      desc = "Jump to a line",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
