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
      desc = "Start Resize Mode",
    },
    {
      "<leader><leader>H",
      function()
        require("smart-splits").swap_buf_left()
      end,
      desc = "Swap Buf Left",
    },
    {
      "<leader><leader>J",
      function()
        require("smart-splits").swap_buf_down()
      end,
      desc = "Swap Buf Down",
    },
    {
      "<leader><leader>K",
      function()
        require("smart-splits").swap_buf_up()
      end,
      desc = "Swap Buf Up",
    },
    {
      "<leader><leader>L",
      function()
        require("smart-splits").swap_buf_right()
      end,
      desc = "Swap Buf Right",
    },
  },
}
