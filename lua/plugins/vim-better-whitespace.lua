return {
  "ntpeters/vim-better-whitespace",
  init = function()
    -- vim.g.better_whitespace_ctermcolor='none'
    -- vim.g.better_whitespace_guicolor='none'
    vim.g.better_whitespace_enabled = 1
    vim.g.better_whitespace_operator = "<leader>ws"
    vim.g.better_whitespace_filetypes_blacklist = { "dbout", "dashboard" }
  end,
  config = function()
    vim.keymap.set("n", "]w", "<cmd>NextTrailingWhitespace<cr>", { silent = true, noremap = true })
    vim.keymap.set("n", "[w", "<cmd>PrevTrailingWhitespace<cr>", { silent = true, noremap = true })
  end,
}
