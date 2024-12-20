return {
  "gbprod/yanky.nvim",
  dependencies = {
    -- "kkharji/sqlite.lua",
    {
      "gbprod/cutlass.nvim",
      opts = {
        cut_key = "x",
        override_del = nil,
        exclude = { "ns", "nS", "xs", "xS" },
      },
    },
  },
  config = function()
    require("yanky").setup({
      -- ring = {
      --   storage = "sqlite",
      -- },
      system_clipboard = {
        sync_with_ring = false,
      },
      picker = {
        select = {
          action = require("yanky.picker").actions.set_register(""),
        },
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
    })

    vim.keymap.set("n", "<space>y", "<cmd>YankyRingHistory<cr>")
    vim.keymap.set("n", "]y", "<Plug>(YankyCycleForward)", {})
    vim.keymap.set("n", "[y", "<Plug>(YankyCycleBackward)", {})
  end,
}
