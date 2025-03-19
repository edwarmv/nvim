return {
  "sindrets/diffview.nvim",
  opts = {},
  keys = {
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview - Open" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview - Close" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview - File History" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview - File History Current File" },
  },
}
