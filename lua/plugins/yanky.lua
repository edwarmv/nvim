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
    require("yanky").setup({})
    -- require("telescope").load_extension("yank_history")

    -- vim.keymap.set("n", "<space>y", "<cmd>Telescope yank_history<cr>")
    vim.keymap.set("n", "<space>y", "<cmd>YankyRingHistory<cr>")
    vim.keymap.set("n", "]y", "<Plug>(YankyCycleForward)", {})
    vim.keymap.set("n", "[y", "<Plug>(YankyCycleBackward)", {})
  end,
}
