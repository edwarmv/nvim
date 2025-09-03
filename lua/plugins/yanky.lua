return {
  "gbprod/yanky.nvim",
  event = "VimEnter",
  dependencies = {
    "kkharji/sqlite.lua",
    -- {
    --   "gbprod/cutlass.nvim",
    --   opts = {
    --     cut_key = "x",
    --     override_del = nil,
    --     exclude = { "ns", "nS", "xs", "xS" },
    --   },
    -- },
    "folke/snacks.nvim",
  },
  opts = {
    ring = {
      storage = "sqlite",
    },
    -- picker = {
    --   select = {
    --     action = require("yanky.picker").actions.set_register(""),
    --   },
    -- },
  },
  keys = {
    {
      "<leader>y",
      function()
        Snacks.picker.yanky()
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
  },
}
