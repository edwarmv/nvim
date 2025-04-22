return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    {
      "<space>qs",
      function()
        require("persistence").load()
      end,
      desc = "Persistence - load the session for the current directory",
    },
    {
      "<space>qS",
      function()
        require("persistence").select()
      end,
      desc = "Persistence - select a session to load",
    },
    {
      "<space>ql",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Persistence - load the last session",
    },
    {
      "<space>qd",
      function()
        require("persistence").stop()
      end,
      desc = "Persistence - stop Persistence",
    },
  },
}
