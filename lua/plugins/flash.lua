return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = false,
      },
    },
    label = {
      rainbow = {
        enabled = false,
      },
    },
    prompt = {
      win_config = {
        border = "none",
      },
    },
  },
  keys = {
    {
      "<leader>s",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "<leader>S",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump({ continue = true })
      end,
      desc = "Flash - Continue last search",
    },
    -- {
    --   "S",
    --   mode = { "n", "o", "x" },
    --   function()
    --     require("flash").treesitter()
    --   end,
    --   desc = "Flash Treesitter",
    -- },
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
  },
}
