return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      cursor_follows_swapped_bufs = true,
    })

    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move Cursor Left"})
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move Cursor Down"})
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move Cursor Up"})
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move Cursor Right"})
    vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap Buf Left"})
    vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap Buf Down"})
    vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap Buf Up"})
    vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap Buf Right"})
  end,
}
