return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    init = function()
      vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
    end,
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>lG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit" },
    },
  },
}
