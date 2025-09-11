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
    "snacks.nvim",
  },
  opts = {
    ring = {
      storage = "sqlite",
    },
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
