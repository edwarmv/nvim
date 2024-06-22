return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    enabled = true,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- exclude_ft = { "oil", "" },
      icons = {
        button = "",
        separator_at_end = false,
      },
      animation = false,
    },
    config = function(_, opts)
      require("barbar").setup(opts)

      vim.keymap.set("n", "<leader>b", "<cmd>BufferPick<cr>", { desc = "[Buffer] Pick" })
      vim.keymap.set("n", "<leader>B", "<cmd>BufferPickDelete<cr>", { desc = "[Buffer] Pick" })
      vim.keymap.set("n", "]b", "<cmd>BufferNext<cr>", { desc = "[Buffer] Cycle Next" })
      vim.keymap.set("n", "[b", "<cmd>BufferPrevious<cr>", { desc = "[Buffer] Cycle Prev" })
      vim.keymap.set("n", "]B", "<cmd>BufferMoveNext<cr>", { desc = "[Buffer] Move Next" })
      vim.keymap.set("n", "[B", "<cmd>BufferMovePrevious<cr>", { desc = "[Buffer] Move Prev" })
    end,
  },
}
