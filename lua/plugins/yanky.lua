return {
  "gbprod/yanky.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    {
      "gbprod/cutlass.nvim",
      opts = {
        cut_key = "x",
        override_del = nil,
        exclude = { "ns", "nS", "xs", "xS" },
      },
    },
    -- "anuvyklack/hydra.nvim",
  },
  config = function()
    -- local mapping = require("yanky.telescope.mapping")
    local utils = require("yanky.utils")
    require("yanky").setup({
      ring = {
        storage = "sqlite",
      },
      highlight = {
        on_put = false,
        on_yank = false,
        timer = 500,
      },
    })
    require("telescope").load_extension("yank_history")

    -- vim.keymap.set("n", "<space>y", "<cmd>YankyRingHistory<cr>", {})
    vim.keymap.set("n", "<space>y", "<cmd>Telescope yank_history<cr>")

    -- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {})
    -- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {})
    -- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
    -- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})

    vim.keymap.set("n", "]y", "<Plug>(YankyCycleForward)", {})
    vim.keymap.set("n", "[y", "<Plug>(YankyCycleBackward)", {})
  end,
}
