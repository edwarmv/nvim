return {
  "mrjones2014/smart-splits.nvim",
  enabled = true,
  opts = {
    cursor_follows_swapped_bufs = true,
  },
  keys = {
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move Cursor Left",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move Cursor Down",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move Cursor Up",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move Cursor Right",
    },
    {
      "<leader><leader>r",
      function()
        require("smart-splits").start_resize_mode()
      end,
      desc = "Move Cursor Right",
    },
    -- vim.keymap.set("n", "<leader><leader>H", require("smart-splits").swap_buf_left, { desc = "Swap Buf Left" })
    -- vim.keymap.set("n", "<leader><leader>J", require("smart-splits").swap_buf_down, { desc = "Swap Buf Down" })
    -- vim.keymap.set("n", "<leader><leader>K", require("smart-splits").swap_buf_up, { desc = "Swap Buf Up" })
    -- vim.keymap.set("n", "<leader><leader>L", require("smart-splits").swap_buf_right, { desc = "Swap Buf Right" })
  },
}
