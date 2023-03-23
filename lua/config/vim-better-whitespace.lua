-- vim.g.better_whitespace_ctermcolor='none'
-- vim.g.better_whitespace_guicolor='none'
vim.g.better_whitespace_enabled = 1
vim.g.better_whitespace_operator = "<leader>ws"
vim.g.better_whitespace_filetypes_blacklist = {
  "diff",
  "git",
  "gitcommit",
  "unite",
  "qf",
  "help",
  "markdown",
  "fugitive",
  "",
  "dashboard",
  "terminal",
  "toggleterm"
}
vim.keymap.set("n", "]w", "<cmd>NextTrailingWhitespace<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "[w", "<cmd>PrevTrailingWhitespace<cr>", { silent = true, noremap = true })
