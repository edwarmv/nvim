return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
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
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o" },
      function()
        require("flash").jump({ continue = true })
      end,
      desc = "Flash - Continue last search",
      {
        "Z",
        mode = { "x" },
        function()
          require("flash").jump({ continue = true })
        end,
        desc = "Flash - Continue last search",
      },
    },
    -- {
    --   "S",
    --   mode = { "n", "o", "x" },
    --   function()
    --     require("flash").treesitter()
    --   end,
    --   desc = "Flash Treesitter",
    -- },
    -- {
    --   "r",
    --   mode = "o",
    --   function()
    --     require("flash").remote()
    --   end,
    --   desc = "Remote Flash",
    -- },
    -- {
    --   "R",
    --   modde= { "o", "x" },
    --   function()
    --     require("flash").treesitter_search()
    --   end,
    --   desc = "Treesitter Search",
    -- },
  },
}
