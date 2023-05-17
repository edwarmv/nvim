vim.g.gitblame_enabled = 0
vim.g.gitblame_set_extmark_options = {
  hl_mode = "combine",
}

return {
  "f-person/git-blame.nvim",
  setup = true,
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "[GitBlame] - Toggle" },
  },
}
