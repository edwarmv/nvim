return {
  "ntpeters/vim-better-whitespace",
  event = "VimEnter",
  init = function()
    -- vim.g.better_whitespace_ctermcolor='none'
    -- vim.g.better_whitespace_guicolor='none'
    vim.g.better_whitespace_enabled = 1
    vim.g.better_whitespace_operator = "<leader>ws"
    vim.g.better_whitespace_filetypes_blacklist = { "dbout", "dashboard", "alpha", "snacks_dashboard" }
  end,
  keys = {
    { "]w", "<cmd>NextTrailingWhitespace<cr>" },
    { "[w", "<cmd>PrevTrailingWhitespace<cr>" },
  },
}
