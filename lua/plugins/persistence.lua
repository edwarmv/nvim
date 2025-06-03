return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    {
      "<leader>ss",
      function()
        require("persistence").load()
      end,
      desc = "Persistence - load the session for the current directory",
    },
    {
      "<leader>sS",
      function()
        require("persistence").select()
      end,
      desc = "Persistence - select a session to load",
    },
    {
      "<leader>sl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Persistence - load the last session",
    },
    {
      "<leader>sd",
      function()
        require("persistence").stop()
      end,
      desc = "Persistence - stop Persistence",
    },
  },
}
