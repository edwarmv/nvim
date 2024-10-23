return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "ibhagwan/fzf-lua" },
  opts = {},
  keys = {
    { "<space>ft", "<cmd>TodoFzfLua<cr>" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>" },
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
  },
}
