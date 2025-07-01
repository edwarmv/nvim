return {
  "sindrets/diffview.nvim",
  opts = {},
  cmd = { "DiffviewOpen" },
  keys = {
    { "<leader><leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview - Open" },
    { "<leader><leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview - Close" },
    { "<leader><leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview - File History" },
    { "<leader><leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview - File History Current File" },
  },
}
